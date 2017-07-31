module MazeClasses

  class Maze
    DELTAS = [[-1, 0], [0, 1], [-1, 0], [0, -1]]

    attr_reader :start_ind, :end_ind, :map

    def initialize(filename)
      @map = load_map(filename)
      @title = parse_title(filename)
      @start_ind = find_start
      @end_ind = find_end
    end

    def load_map(filename)
      maze = []
      File.open(filename).each_line do |line|
        chars = line.split(//)
        maze << chars
      end
      maze
    end

    def is_wall?(point)
      x, y = point
      @map[y][x]
    end

    def in_maze?(point)
      x, y = point
      not_negative = (x >= 0) && (y >= 0)
      within_bounds = (x <= @map[0].length) && (y <= @map.length)
      not_negative && within_bounds
    end

    def parse_title(filename)
      filename.match(/(.+)\.txt/)[1]
    end

    def to_s
      string = "MAZE: #{@title}\n"
      @map.each do |line|
        string << line.join("")
      end
      string
    end

    def find_start
      find_char("S")
    end

    def find_end
      find_char("E")
    end

    def find_char(char)
      @map.each_with_index do |line, y|
        return [line.index(char), y] if line.index(char)
      end
    end

    def find_neighbors(point)
      x, y = point
      neighbors = []
      DELTAS.each do |d_x, d_y|
        neighbor = [(d_x + x), (d_y + y)]
        if in_maze?(neighbor) && !(is_wall?(neighbor))
          neighbors << neighbor
        end
      end
      neighbors
    end

    def travel_path(path)
      puts "Traveling path of #{path.inspect}..."
      copy_map = deep_dup(@map)
      path.each do |coords|
        x, y = coords
        point = copy_map[y][x]
        if point == "X"
          puts "This path back-tracks to #{x}, #{y}."
        elsif point == "*"
          puts "This path hits a wall at #{x}, #{y}."
        else
          copy_map[y][x] = "X"
        end
      end

      show_path(copy_map)
    end

    def show_path(map)
      map.each do |line|
        puts line.join("")
      end
    end

    private

    def deep_dup(item)
      unless item.class == Array
        item.dup
      else
        new_arr = []
        item.each do |item|
          new_arr << deep_dup(item)
        end
        new_arr
      end
    end

  end

end

if __FILE__ == $PROGRAM_NAME
  filename = ARGV[0] || "maze1.txt"
  test_maze = MazeClasses::Maze.new(filename)
  puts test_maze
  puts "Start is at #{test_maze.start_ind}"
  puts "End is at #{test_maze.end_ind}"
end
