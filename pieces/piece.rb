class Piece
  attr_accessor :pos
  attr_reader   :color

  def initialize(pos, color)
    @pos = pos
    @color = color
  end

  def to_s
    " P "
  end

end
