
	def check_for_block_fork(ttt_board)
	
		block_fork_combinations = [[ttt_board[0],ttt_board[1],ttt_board[2]],
							[ttt_board[3],ttt_board[4],ttt_board[5]],
							[ttt_board[6], ttt_board[7], ttt_board[8]],
							[ttt_board[0], ttt_board[3], ttt_board[6]],
							[ttt_board[1],ttt_board[4], ttt_board[7]],
							[ttt_board[2],ttt_board[5],ttt_board[8]], 
							[ttt_board[0], ttt_board[4], ttt_board[8]],
							[ttt_board[2],ttt_board[4],ttt_board[6]]]

		block_fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		marker = "X"
		if marker == "X"
			p2_marker = "O"
		else
			p2_marker = "X"
		end
		

		block_fork_line = []
		block_fork_spot = []
		i = []
		i2 = 0
		result = 10
		e = 0
		
		block_fork_combinations.each_with_index do |block_line, index|
			if block_line.count(p2_marker) == 1 && block_line.count(" ") == 2
				block_fork_line << block_line
				i.push(index)
				e = index
			end
		end
	puts block_fork_line
	end

	ttt_board = ["X"," "," "," ","O"," "," "," ","X"]	
	check_for_block_fork(ttt_board)