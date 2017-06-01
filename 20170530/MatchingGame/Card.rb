class Card

  attr_reader :face_value, :visible

  def initialize(face_value)
    @face_value = face_value
    @visible = false
  end

  def hide
    @visible = false
  end

  def reveal
    @visible = true
  end

  def to_s
    @face_value
  end

  def ==(other_card)
    @face_value == other_card.face_value
  end

end
