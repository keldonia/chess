class Piece
  attr_accessor :pos
  attr_reader   :color, :board

  def initialize(pos, color, board)
    @pos   = pos
    @color = color
    @board = board
  end

  def to_s
    " P "
  end



  def moves #returns array of all valid moves
    possible_moves(pos, relative_moves)
  end

  def possible_moves(start_pos, relative_moves_hash)
    all_moves = []

    relative_moves_hash.each do |direction|
      all_moves += moves_for_direction(start_pos, direction)
    end

    all_moves
  end

  def moves_for_direction(start_pos, direction)
    offset = direction[:offset]
    remaining_steps = direction[:steps]
    next_pos = pos_plus_step(start_pos, offset)

    return [] if !board.in_bounds?(next_pos)

    piece_at_pos = board.piece_color_at_pos(next_pos)
    friendly_piece = piece_at_pos == color

    if friendly_piece || remaining_steps.zero?
      return []
    elsif piece_at_pos && !friendly_piece
      return [next_pos]
    else
      remaining_steps -= 1
      next_direction = { offset: offset, steps: remaining_steps }
      [next_pos] + moves_for_direction(next_pos, next_direction)
    end
  end

  def pos_plus_step(start_pos, step)
    [start_pos[0] + step[0], start_pos[1] + step[1]]
  end
end
