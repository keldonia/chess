class Knight < Piece
  attr_reader :relative_moves
  def initialize(pos, color, board)
    super
  end

  RELATIVE_MOVES = [
    {offset: [-2,-1],  steps: 1},
    {offset: [2,-1],   steps: 1},
    {offset: [-1,-2],  steps: 1},
    {offset: [-1,2],   steps: 1},
    {offset: [1,-2],   steps: 1},
    {offset: [1,2],    steps: 1},
    {offset: [-2,1],   steps: 1},
    {offset: [2,1],    steps: 1}
  ]

  def to_s
    " ♞ "
  end

  def relative_moves
    RELATIVE_MOVES
  end

end
