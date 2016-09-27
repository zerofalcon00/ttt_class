require_relative "sequential_ai.rb"
require_relative "random_ai.rb"
require_relative "console_ai.rb"
require_relative "board.rb"


class ConsoleGame

	attr_accessor :p1, :p2, :board, :p1_marker, :p2_marker, :current_player

	def initialize(p1, p2)

		@p1 = p1
		@p2 = p2
		@board = Board.new
		# @p1_marker = p1_marker
		# @p2_marker = p2_marker
		@current_player = p2
		
	end

	def start_game
		"Welcome to tic tac toe!"
	end

	def display_board()
		
		puts " #{board.ttt_board[0]} | #{board.ttt_board[1]} | #{board.ttt_board[2]} "
		puts "-----------"
		puts " #{board.ttt_board[3]} | #{board.ttt_board[4]} | #{board.ttt_board[5]} "
		puts "-----------"
		puts " #{board.ttt_board[6]} | #{board.ttt_board[7]} | #{board.ttt_board[8]} "

		if current_player == p2
			player = p1
		else 
			player = p2
		end

		if board.check_for_win?(current_player.marker) == false || board.check_for_tie? == 0
			puts "It is #{player.marker}'s turn."
		end

	end

	def change_player()
		
		if @current_player == p1
			@current_player = p2
		else @current_player == p2
			@current_player = p1
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
			
		elsif player_choice == "O"

			puts "Player 1 is O and Player 2 is X"
			
		else
			puts "Please enter valid character"
			player_choice = marker_choice
		end
		player_choice
	end

	def ask_to_player_human_or_cpu(p1_marker)
		puts "Would you like to play CPU or Human"
		player_choice = gets.chomp.upcase()

		if p1_marker == "X"
			p2_marker = "O"
		else p1_marker == "O"
			p2_marker = "X"
		end

		if player_choice == "CPU"
			p2 = RandomAi.new
		else player_choice == "HUMAN"
			p2 = ConsoleAI.new(p2_marker)
			# puts p2_marker
		end
		p2
	end


	def game_over?
		board.check_for_win?(current_player.marker) || board.check_for_tie?
	end

	def get_player_move
		current_player.get_move(board.ttt_board)
	end

	def make_move(move)
		board.update_board(move, current_player.marker)
	end

	def player
		current_player
	end

	def winner
		if board.check_for_win?(current_player.marker)
			puts "#{current_player.marker} is the WINNER!"
		else
			puts "The game is a TIE!"
		end
	end



end