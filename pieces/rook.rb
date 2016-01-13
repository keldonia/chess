class Rook < Piece
  def initialize(pos, color, board)
    super
  end

  RELATIVE_MOVES = [
    {offset: [-1,0], steps: 7},
    {offset: [1,0],  steps: 7},
    {offset: [0,1],  steps: 7},
    {offset: [0,-1], steps: 7}
  ]

  def to_s
    " ♜ "
  end

  def relative_moves
    RELATIVE_MOVES
  end

end
