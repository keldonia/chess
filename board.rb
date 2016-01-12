load './piece.rb'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) }
    populate_board
  end

  def in_bounds?(pos)
    x, y = pos
    return true if (0..7).include?(x) && (0..7).include?(y)
    false
  end

  def move(start_pos, end_pos)

  end




  def [](x, y)
    @grid[x][y]
  end

  def []=(x, y, value)
    @grid[x][y] = value
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
      Pawn.new(pos, :black)
    when 6
      Pawn.new(pos, :white)
    when 7
      back_row_positions(pos, :white)
    else
      nil
    end
  end

  def back_row_positions(pos, color)
    case pos[1]
    when 0, 7
      Rook.new(pos, color)
    when 1, 6
      Knight.new(pos, color)
    when 2, 5
      Bishop.new(pos, color)
    when 3
      Queen.new(pos, color)
    when 4
      King.new(pos, color)
    end
  end
end
