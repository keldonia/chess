load './display.rb'

class Player
  attr_reader :name, :display


  def initialize(name, board)
    @name = name
    @board = board
    @display = Display.new(@board)
  end

  def get_move
    #puts instructions for entering input
    from = get_input_loop
    to = get_input_loop
    [from, to]
  end

  def get_input_loop
    result = nil

    until result
      display.render
      result = display.get_input
    end

    result
  end
end
