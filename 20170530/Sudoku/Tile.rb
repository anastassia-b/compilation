class Tile
  attr_accessor :number
  attr_reader :given

  def initialize(num, given)
    @number = num
    @given = given
  end

  def to_s
    @number
  end

end
