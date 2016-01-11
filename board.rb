load './piece.rb'
require 'byebug'

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) {Array.new(8) }
    populate_board
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
    Piece.new(pos)
  end
end
