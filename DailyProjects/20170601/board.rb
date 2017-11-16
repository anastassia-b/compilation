class Board
  attr_reader :board, :size

  def initialize(size, bombs)
    @size = size
    @board = Array.new(size) { Array.new (size) {" "} }
    random_bomb_placement(bombs)
    assign_bomb_counts
  end

  def random_bomb_placement(num)
    hot_spots = []
    until hot_spots.length == num do
      pos = [rand(size), rand(size)]
      hot_spots << pos unless hot_spots.include?(pos)
    end
    hot_spots.each { |pos| self[pos] = "*" }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

  def render
    puts "#{"-" * (size * 2)}---"
    board.each do |row|
      puts "| #{row.join(" ")} |"
    end
    puts "#{"-" * (size * 2)}---"
  end

  def count_bomb_neighbors(pos)
    count = 0
    x, y = pos
    (x-1..x+1).each do |row|
      (y-1..y+1).each do |col|
        if valid_pos?(row,col)
          count += 1 if board[row][col] == "*"
        end
      end
    end
    count
  end

  def valid_pos?(row, col)
    row.between?(0, size - 1) && col.between?(0, size - 1)
  end

  def assign_bomb_counts
    (0...size).each do |x|
      (0...size).each do |y|
        next if board[x][y] == "*"
        board[x][y] = count_bomb_neighbors([x,y])

      end
    end
  end

end
