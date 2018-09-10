require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    attr_reader :board, :current_player

    def initialize (player_one, player_two)
        @player_one = player_one
        @player_two = player_two
        @board = Board.new
        @current_player = @player_one
    end

    def play_turn
        player_symb = @current_player == @player_one ? :X : :O
        coord = @current_player.get_move
        @board.place_mark(coord, player_symb)
        switch_players!
    end

    def switch_players!
        @current_player = @current_player == @player_one ? @player_two : @player_one
    end
end
