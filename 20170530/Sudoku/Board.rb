require_relative "Tile.rb"

class Board
  attr_reader :board, :grid

  def self.from_file
    lines = File.readlines("sudoku1.txt").map(&:chomp)
    grid = []
    lines.each do |line|
      row = line.split("")
      tile_row = []
      row.each do |num|
        tile_row << Tile.new(num, !(num == "0"))
      end
      grid << tile_row
    end
    grid
  end

  def initialize
    @board = Board.from_file
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, num)
    row, col = pos
    @board[row][col] = num
  end

  def render
    puts "-" * 21
    @board.each do |row|
      print "| "
      row.each do |tile|
        print "#{tile} "
      end
      print "| \n"
    end
    puts "-" * 21
  end

  def solved?
    solution = []
    lines = File.readlines("solution1.txt").map(&:chomp)
    lines.each do |line|
      solution << line.split("")
    end
    (0...9).each do |i1|
      (0...9).each do |i2|
        return false unless self[[i1,i2]] == solution[i1][i2]
      end
    end
    true
  end

end
