class UnbeatableAI
	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(ttt_board)
		
		if check_for_winning_move(ttt_board) <= 8
			move = check_for_winning_move(ttt_board)
		elsif check_for_block(ttt_board) <= 8
			move = check_for_block(ttt_board)
		else check_for_fork(ttt_board) <= 8
			move = check_for_fork(ttt_board)
		# else check_for_block_fork(ttt_board) <= 8
		# 	move = check_for_block_fork(ttt_board)
		end
		move
	end

	def check_for_winning_move(ttt_board)

		winning_combinations = [[ttt_board[0],ttt_board[1],ttt_board[2]],
								[ttt_board[3],ttt_board[4],ttt_board[5]],
								[ttt_board[6], ttt_board[7], ttt_board[8]],
								[ttt_board[0], ttt_board[3], ttt_board[6]],
								[ttt_board[1],ttt_board[4], ttt_board[7]],
								[ttt_board[2],ttt_board[5],ttt_board[8]], 
								[ttt_board[0], ttt_board[4], ttt_board[8]],
								[ttt_board[2],ttt_board[4],ttt_board[6]]]

		win_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		# winner = 10
		# i = 0
		# i2 = 0
		pick = 10

		winning_combinations.each_with_index do |winning_line, index|
			if winning_line.count(marker) == 2 && winning_line.count(" ") == 1
				winner = winning_line.index(" ")
				i = index
				pick = win_positions[i][winner]
			end
		end

		# if winner == 10
		# 	i2 = 10
		# else
		# 	i2 = winner.index(" ")
		# end

		# if win_positions[i][i2]	== nil
		# 	pick
		# else
		# 	pick = win_positions[i][i2]
		# end
		pick
	end

	def check_for_block(ttt_board)
		
		blocking_combinations = [[ttt_board[0],ttt_board[1],ttt_board[2]],
								[ttt_board[3],ttt_board[4],ttt_board[5]],
								[ttt_board[6], ttt_board[7], ttt_board[8]],
								[ttt_board[0], ttt_board[3], ttt_board[6]],
								[ttt_board[1],ttt_board[4], ttt_board[7]],
								[ttt_board[2],ttt_board[5],ttt_board[8]], 
								[ttt_board[0], ttt_board[4], ttt_board[8]],
								[ttt_board[2],ttt_board[4],ttt_board[6]]]

		block_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		if marker == "X"
			p2_marker = "O"
		else
			p2_marker = "X"
		end

		block =  10 
		
		i = 0
		i2 = 0
		pick = 10
		
		blocking_combinations.each_with_index do |blocking_line, index|
			if blocking_line.count(p2_marker) == 2 && blocking_line.count(" ") == 1
				block = blocking_line
				i = index
			end
		end

		if block == 10
			i2 = 10
		else
			i2 = block.index(" ")
		end

		if block_positions[i][i2] == nil
			pick = 10
		else
			pick = block_positions[i][i2]
		end
		pick

	end

	def check_for_fork(ttt_board)
		fork_combinations = [[ttt_board[0],ttt_board[1],ttt_board[2]],
							[ttt_board[3],ttt_board[4],ttt_board[5]],
							[ttt_board[6], ttt_board[7], ttt_board[8]],
							[ttt_board[0], ttt_board[3], ttt_board[6]],
							[ttt_board[1],ttt_board[4], ttt_board[7]],
							[ttt_board[2],ttt_board[5],ttt_board[8]], 
							[ttt_board[0], ttt_board[4], ttt_board[8]],
							[ttt_board[2],ttt_board[4],ttt_board[6]]]

		fork_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

		fork_line = []
		fork_spot = []
		i = []
		i2 = 0
		result = 10
		
		fork_combinations.each_with_index do |forking_line, index|
			if forking_line.count(marker) == 1 && forking_line.count(" ") == 2
				fork_line.push(forking_line)
				i.push(index)
			end
		end


		i.each do |index|
			fork_spot.push(fork_positions[index])
		end

		fork_spot = fork_spot.flatten

		if fork_spot.detect { |match| fork_spot.count(match) > 1} == nil
			result = 10
		else
			result = fork_spot.detect { |match| fork_spot.count(match) > 1}
		end
		result 
	end

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
		
		block_fork_combinations.each_with_index do |block_forking_line, index|
			if block_forking_line.count(p2_marker) == 1 && block_forking_line.count(" ") == 2
				block_fork_line.push(block_forking_line)
				i.push(index)
				e = index
			end
		end
		
		i.each do |index|
			block_fork_spot.push(block_fork_positions[index])
		end

		block_fork_spot = block_fork_spot.flatten

		if block_fork_spot.detect { |match| block_fork_spot.count(match) > 1} == nil
			result = 10
		else
			result = block_fork_spot.detect { |match| block_fork_spot.count(match) > 1}
		end
		result	

		marker_lines = []
		choice = 10

		block_fork_combinations.each_with_index do | marker_line, index|
			if marker_line.count(marker) == 1 && marker_line.count(" ") == 2
				puts marker_line
			end
		end
		
		pick_to_force_block = marker_lines.index(" ")
		pick_marker = marker_lines.index(" ")
		# marker_lines(pick_marker) = marker
		check_spot_for_fork_index = marker_lines.index(" ")
		check_spot_for_fork = block_fork_positions[e][check_spot_for_fork_index]

		if check_spot_for_fork == result
			choice = result
		elsif check_spot_for_fork != result
			choice = pick_to_force_block
		else
			choice = 10
		end
		choice

	end
end

player = UnbeatableAI.new("O")
ttt_board = ["X"," "," "," "," ","","X","O","X"]




