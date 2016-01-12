load './cursorable.rb'
require 'colorize'

class Display
  include Cursorable
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor_pos = [0, 0]
  end

  def render
    system("clear")
    print_board
  end

  def print_board
    board.grid.each_with_index do |row, idx|
      line = "#{8 - idx} "
      row.each do |piece|
        color_options = colors_for(piece)
        line += piece.to_s.colorize(color_options)
      end
      puts line
    end
    puts "   A  B  C  D  E  F  G  H "
  end

  def colors_for(piece)
    {background: background_color(piece.pos), color: piece.color}
  end

  def background_color(pos)
    x, y = pos
    if [x, y] == @cursor_pos
      return :light_yellow #cursor
    elsif (x + y).even?
      return :light_blue #white space
    else
      return :light_red #black space
    end
  end
end
