class RandomAI

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def valid_space(board, choice)
		board[choice] != "X" || board[choice] != "O"
	end
		



	def get_move(board)
		# create a new array with index # with empty stings and randomly select them
		# board.each_index{|i| board[i]==" "}.sample
		# move = []
		# i = 0
		# board.each do  |board_spot|

		# 	if board_spot == "(i + 1)"
		# 		move.push(i)
		# 	end
		# 	i = i + 1
		# end

		n = rand(0..8)

		if valid_space(board, n) == false
			get_move(board)
		else
			n
		end
		
			
		
		# move.sample


	end
end
