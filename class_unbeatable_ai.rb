class UnbeatableAI
	attr_accessor :marker

	def initialize(marker, name)
		@name = name
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
		# elsif check_for_center(ttt_board) <=8
		# 	move = check_for_center(ttt_board)
		# elsif check_for_corner(ttt_board) <=8
		# 	move = check_for_corner(ttt_board)
		# elsif check_for_empty_corner(ttt_board) <= 8
		# 	move = check_for_empty_corner(ttt_board)
		# else check_for_empty_side(ttt_board) <= 8
		# 	move = check_for_empty_side(ttt_board)
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
		pick = pick + 1
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
		pick = pick + 1

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
		
		if ttt_board[result] != " "
			result = 10
		else
			result
		end
		result = result + 1
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
		blah = []
		
		result = 10
	
		
		block_fork_combinations.each_with_index do |block_line, index|
			if block_line.count(p2_marker) == 1 && block_line.count(" ") == 2
				block_fork_line.push(block_line)
				i.push(index)
				blah.push(block_fork_positions[index])

			end
		end

		blah = blah.flatten

		empty_spots = []
		blah
		blah.each do |spot|
			if ttt_board[spot] != p2_marker
				empty_spots.push(spot)
			end
		end
		empty_spots.uniq
		result = empty_spots.shift
		result = result + 1
	end

	def check_for_center(ttt_board)
		if ttt_board[4] = " "
			move = 4
		else
			move = 10
		end
		move = move + 1
	end

	def check_for_corner
		if ttt_board[0] == p2_marker
			move = 8
		elsif ttt_board[2] == p2_marker
			move = 6
		elsif ttt_board[6] == p2_marker
			move = 2
		elsif ttt_board[8] == p2_marker
			move = 0
		else
			move = 10
		end
		move = move + 1
	end

	def check_for_empty_corner(ttt_board)

		corners = [0,2,6,8]
		answer = []

		corners.each do |corner|
			if corner == " "
				answer.push(corner)
			end
		end
		answer = answer.shift
		answer = answer + 1
	end

	def check_for_empty_side(ttt_board)

		sides = [1,3,5,7]
		answer = []

		sides.each do |side|
			if side == " "
				answer.push(side)
			end
		end
		answer = answer.shift
		answer = answer + 1
	end
			
end





