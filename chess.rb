load './board.rb'
load './player.rb'

class Chess
  attr_reader :players, :board

  def initialize(player1 = "Jim", player2 = "Bob")
    @board = Board.new
    @players = [Player.new(player1, @board), Player.new(player2, @board)]
  end

  def play
    won = false
    until won # Placeholder loop
      players.each do |player|
        begin
        player_move = player.get_move #[[from_x, from_y], [to_x, to_y]]
        board.move(player_move[0], player_move[1])
        rescue InvalidMoveError => e
          puts "Error was #{e.message}"
          retry
        end
      end
    end
  end
end


class InvalidMoveError < StandardError
end
