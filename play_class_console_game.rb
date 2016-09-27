require_relative "class_console_game.rb"

puts "Welcome to Tic Tac Toe"

game = ConsoleGame.new

game.ask_to_play

p1_marker = game.marker_choice

p2_marker = game.ask_to_player_human_or_cpu(p1_marker)




