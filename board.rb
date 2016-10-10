class Board

	attr_accessor :ttt_board

	def initialize()
		@ttt_board = [" "," "," "," "," "," "," "," "," "]
	end

	def board_with_positions()
		new_board = []
		ttt_board.each_with_index do |value, index|
			if value == "X" || value == "O"
				new_board.push(value)
			else
				new_board.push(index + 1)
			end
		end
		new_board
	end

	def update_board(index, marker)
		ttt_board[index] = marker
	end

	def valid_spot?(index)
		index = (index - 1)
		index >= 0 && index <= 8 && ttt_board[index] == "#{(index + 1)}"
	end

	def check_for_tie?
		ttt_board.count(" ") == 0
	end

	def check_for_win?(marker)
		result = false
		winning_combinations = [[ttt_board[0],ttt_board[1],ttt_board[2]],
								[ttt_board[3],ttt_board[4],ttt_board[5]],
								[ttt_board[6], ttt_board[7], ttt_board[8]],
								[ttt_board[0], ttt_board[3], ttt_board[6]],
								[ttt_board[1],ttt_board[4], ttt_board[7]],
								[ttt_board[2],ttt_board[5],ttt_board[8]], 
								[ttt_board[0], ttt_board[4], ttt_board[8]],
								[ttt_board[2],ttt_board[4],ttt_board[6]]]
		winning_combinations.each do |winner|
			if winner.count(marker) == 3
				result = true
			end
		end
		result
		# ttt_board[0] == marker && ttt_board[3] == marker && ttt_board[6] == marker ||
		# ttt_board[0] == marker && ttt_board[1] == marker && ttt_board[2] == marker ||
		# ttt_board[3] == marker && ttt_board[4] == marker && ttt_board[5] == marker ||
		# ttt_board[6] == marker && ttt_board[7] == marker && ttt_board[8] == marker ||
		# ttt_board[1] == marker && ttt_board[4] == marker && ttt_board[7] == marker ||
		# ttt_board[2] == marker && ttt_board[5] == marker && ttt_board[8] == marker ||
		# ttt_board[6] == marker && ttt_board[4] == marker && ttt_board[2] == marker ||
		# ttt_board[0] == marker && ttt_board[4] == marker && ttt_board[8] == marker 
	end

	# def game_over(marker)
	# 	check_for_win?(marker) ||




end