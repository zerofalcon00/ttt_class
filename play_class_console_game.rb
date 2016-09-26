require_relative "class_console_game.rb"

puts "Welcome to Tic Tac Toe"

game = ConsoleGame.new

game.ask_to_play

game.marker_choice

game.ask_to_player_human_or_cpu