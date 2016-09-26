require_relative "sequential_ai.rb"
require_relative "random_ai.rb"
require_relative "console_ai.rb"
require_relative "board.rb"


class ConsoleGame

	attr_accessor :p1, :p2, :board, :p1_marker, :p2_marker

	def initialize()
		@p1 
		@p2 
		@board = Board.new
		@p1_marker = p1_marker
		@p2_marker = p2_marker
		# @current_player = change_player(player2)
		
	end

	def display_board(board)
		puts " #{board[0]} | #{board[1]} | #{board[2]} "
		puts "-----------"
		puts " #{board[3]} | #{board[4]} | #{board[5]} "
		puts "-----------"
		puts " #{board[6]} | #{board[7]} | #{board[8]} "
	end

	def change_player(player)
		
		if player == p1
			player = p2
		else player == p2
			player = p1
		end
	end
		
	

	# def ask_to_play
	# 	puts "Would you like to play?"
	# end
	def ask_to_play
		puts "Would you like to play?"
		player_choice = gets.chomp.upcase

		if player_choice == "YES"
		
		else
			puts "Good Bye!"
			exit
		end
	end

	def marker_choice
		puts "Player 1 would you like to be X or O"
		player_choice = gets.chomp.upcase  


		if player_choice == "X"
		
			puts "Player 1 is #{player_choice} and Player 2 is O" 
			p1_marker = "X" 
			p2_marker = "O"
		elsif player_choice == "O"

			puts "Player 1 is O and Player 2 is X"
			p1_marker = "O" 
			p2_marker = "X"

		else
			puts "Please enter valid character"
			player_choice = marker_choice
		end
		puts player_choice
	end

	def ask_to_player_human_or_cpu
		puts "Would you like to play CPU or Human"
		player_choice = gets.chomp.upcase

		if player_choice == "CPU"
			p2 = RandomAi.new
		else player_choice == "HUMAN"
			# p2 = ConsoleAI.new(p2_marker)
			puts p2_marker
		end
	end






end