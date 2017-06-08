class TowersOfHanoi
  attr_reader :tower

  def initialize
    @tower = [[3, 2, 1],[],[]]
  end

  def move(from, to)
    raise TypeError unless Integer(from) && Integer(to)
    disk = @tower[from].pop
    @tower[to] << disk
  end

  def get_input
    puts "Enter (from, to) towers: "
    input = gets.chomp
    pos = input.split(",").map(&:to_i)
    from = pos[0]
    to = pos[1]
    [from, to] if is_valid?(from, to)
  end

  def won?
    return true if @tower == [[],[],[3, 2, 1]]
    false
  end

  def play
    until won?
      p @tower
      pos = get_input
      move(pos[0], pos[1])
    end
    p "congrads you won."


  end

  def is_valid?(from, to)
    if @tower[to] == []
      true
    elsif @tower[from] == []
      false
    elsif @tower[from][-1] < @tower[to][-1]
      true
    else
      false
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play
end
