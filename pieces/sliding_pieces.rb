#Not in active use

module SlidingPieces

  def sliding_moves(start_pos, relative_directions)
    all_moves = []
    relative_directions.each do |direction|
      all_moves += moves_for_direction(start_pos, direction)
    end
  end

  def moves_for_directions(start_pos, direction)
    piece_at_pos = board.piece_color_at_pos(start_pos)
    if board.in_bound?(start_pos) == false ||
      piece_at_pos == color
      return []
    elsif piece_at_pos != nil &&
      piece_at_pos != color
      return start_pos
    else
      start_pos += moves_for_direction(pos_plus_step(start_pos, direction), direction)
    end
  end


  def moves_for_directions(start_pos, direction)
    piece_at_pos = board.piece_color_at_pos(start_pos)
    if board.in_bound?(start_pos) == false ||
      piece_at_pos == color || direction[2] == 0
      return []
    elsif piece_at_pos != nil && piece_at_pos != color
      return start_pos
    else
      start_pos += moves_for_direction(pos_plus_step(start_pos, direction.take(2)),
      direction[2] ? (direction.take(2) + direction[2] - 1) : direction )
    end
  end
end
