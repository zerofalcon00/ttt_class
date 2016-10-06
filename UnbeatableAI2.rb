class UnbeatableAI2
	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		
		if marker == "X"
			p2_marker = "O"
		else
			p2_marker = "X"
		end

		# board = [" "," "," "," "," "," "," "," "," "]
		first_move = board[4]
		second_move = [board[0], board[2], board[6], board[8]]
		
		if first_move == " "
			first_move = marker
			4
		elsif 
			pick = []
			block = []


			second_move.each do |corner|
				if corner == " "
					pick.push(corner)
				else corner == p2_marker
					block.push(corner)
				end
			end

			if block == second_move[1]
				second_move[4] = marker
			elsif block == second_move[2]
				second_move[3] = marker
			elsif block == second_move[4]
				second_move[1] = marker
			elsif block == second_move3[3]
				second_move[2] = marker
			else
				pick.sample
			end
		end
	end
end