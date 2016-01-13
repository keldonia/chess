require 'byebug'
load './piece.rb'


class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) }
    populate_board
  end

  def in_bounds?(pos)
    # pos.all? { |coord|(0..7).include?(coord) }
    x, y = pos
    return true if (0..7).include?(x) && (0..7).include?(y)
    false
  end

  def move(start_pos, end_pos)
    # debugger
    raise InvalidMoveError.new "no piece at this position" if self[*start_pos].nil?
    p start_pos
    p end_pos
    puts "piece moves:"
    piece = self[*start_pos]
    p piece_moves = piece.moves
    if piece_moves.include?(end_pos)
      self[*end_pos] = piece
      self[*start_pos] = nil
    else
      raise InvalidMoveError.new "an invalid move"
    end
  end

  def piece_color_at_pos(pos)
    return nil if self[*pos].nil?
    self[*pos].color
  end


  def [](x, y)
    @grid[x][y]
  end

  def []=(x, y, piece)
    @grid[x][y] = piece
    piece.pos = [x, y] if piece
  end

  def populate_board
    8.times do |x|
      8.times do |y|
        self[x, y] = piece_pos([x, y])
      end
    end
  end

  private

  def piece_pos(pos)
    case pos[0]
    when 0
      back_row_positions(pos, :black)
    when 1
      Pawn.new(pos, :black, self)
    when 6
      Pawn.new(pos, :white, self)
    when 7
      back_row_positions(pos, :white)
    else
      nil
    end
  end

  def back_row_positions(pos, color)
    case pos[1]
    when 0, 7
      Rook.new(pos, color, self)
    when 1, 6
      Knight.new(pos, color, self)
    when 2, 5
      Bishop.new(pos, color, self)
    when 3
      Queen.new(pos, color, self)
    when 4
      King.new(pos, color, self)
    end
  end
end
