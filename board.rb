class Board

	attr_accessor :ttt_board

	def initialize()
		@ttt_board = [" "," "," "," "," "," "," "," "," "]
	end

	def update_board(index, marker)
		ttt_board[index] = marker
	end

	def valid_spot?(index)
		index >= 0 && index <= 8 && ttt_board[index] == " "
	end

	def check_for_tie?
		ttt_board.count(" ") == 0
	end

	def check_for_win?(marker)
		ttt_board[0] == marker && ttt_board[3] == marker && ttt_board[6] == marker ||
		ttt_board[0] == marker && ttt_board[1] == marker && ttt_board[2] == marker ||
		ttt_board[3] == marker && ttt_board[4] == marker && ttt_board[5] == marker ||
		ttt_board[6] == marker && ttt_board[7] == marker && ttt_board[8] == marker ||
		ttt_board[1] == marker && ttt_board[4] == marker && ttt_board[7] == marker ||
		ttt_board[2] == marker && ttt_board[5] == marker && ttt_board[8] == marker ||
		ttt_board[6] == marker && ttt_board[4] == marker && ttt_board[2] == marker ||
		ttt_board[0] == marker && ttt_board[4] == marker && ttt_board[8] == marker 
		
	end




end