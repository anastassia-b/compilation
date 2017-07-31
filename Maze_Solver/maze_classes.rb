module MazeClasses

  class Maze
    DELTAS = [[-1, 0], [0, 1], [-1, 0], [0, -1]]

    attr_reader :start_ind, :end_ind

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

    end

    def in_maze?(point)

    end

    def parse_title(filename)
      filename.match(/(.+)\.txt/)[1]
    end

    def to_s

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

    end

    def travel_path(path)

    end

    def show_path(map)

    end

    private

    def deep_dup(item)

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
