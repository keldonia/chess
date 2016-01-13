class Pawn < Piece
  def initialize(pos, color, board)
    super
  end

  RELATIVE_MOVES = [
    {offset: [-1, 0], steps: 1},
    {offset: [1,0],   steps: 1}
    ]

  def to_s
    " ♟ "
  end

  def relative_moves

    if color == :white
      RELATIVE_MOVES.take(1)
    else
      RELATIVE_MOVES.drop(1)
    end
  end

end
