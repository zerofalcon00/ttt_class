class SequentialAI

	attr_reader :marker, :name
	
	def initialize(marker, name)
		@name = name
		@marker = marker
	end

	def get_move(board)
		answer = (board.index(" ") + 1)
	end

	# def valid_space(board, choice)
	# 	board[choice] != "X" || board[choice] != "O"
	# end
end
