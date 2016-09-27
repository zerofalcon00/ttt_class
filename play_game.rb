require_relative "class_console_game.rb"

p1 = ConsoleAI.new("X")
p2 = RandomAI.new("O")
game = ConsoleGame.new(p1, p2)

array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

game.start_game()
game.display_board()

until game.game_over?
	
	game.change_player
	move = game.get_player_move
	game.make_move(move)
	game.display_board()
end
game.winner

#negamax