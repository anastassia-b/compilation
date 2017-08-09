require_relative 'disk'

class Board

  def initialize
    @board = Array.new(6) { Array.new(7) }
  end

  def drop_disk(col, disk)

  end

  def over?

  end

  def winner

  end

  def render
    system("clear")
    @board.each do |row|
      r = []
      row.each do |spot|
        r << spot
      end
      puts "| #{r.join(' | ')} |"
    end
    puts "----------------------"
  end

end
