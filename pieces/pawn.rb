class Pawn < Piece
  attr_reader :first_pos

  def initialize(pos, color, board)
    super
    @first_pos = pos
  end

  RELATIVE_MOVES = [
    {offset: [-1, 0]},
    {offset: [1,0]}
    ]

  CAPTURE_POSITIONS = [
    [-1, -1],
    [-1, 1],
    [1, 1],
    [1, -1]
  ]

  def to_s
    " ♟ "
  end

  def relative_moves
    moves = basic_pawn_moves
    moves += capture_moves
  end

  def basic_pawn_moves
    moves = []

    if color == :white
      moves += RELATIVE_MOVES.take(1)
    else
      moves += RELATIVE_MOVES.drop(1)
    end

    first_pos == pos ? steps = 2 : steps = 1
    moves[0][:steps] = steps

    moves
  end

  def capture_moves
    moves = []

    # if color == :white
    #   rel_capture_pos = CAPTURE_POSITIONS.take(2)
    # else
    #   rel_capture_pos = CAPTURE_POSITIONS.drop(2)
    # end
    #
    # rel_capture_pos.each do |rel_pos|
    #   temp = pos_plus_step(pos, rel_pos)
    #
    #   next unless board.in_bounds?(temp)
    #
    #   temp2 = board[*temp].piece_color_at_pos(temp)
    #
    #   if temp2 != color && temp2 != nil
    #     moves << {offset: temp, steps: 1}
    #   end
    # end
    # p moves

    moves
  end

end
