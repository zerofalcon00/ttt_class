class UnbeatableAI
	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		if marker == "X"
			opponent_marker = "O"
		else 
			opponent_marker = "X"
		end

		winning_combinations = [[ttt_board[0],ttt_board[1],ttt_board[2]],
								[ttt_board[3],ttt_board[4],ttt_board[5]],
								[ttt_board[6], ttt_board[7], ttt_board[8]],
								[ttt_board[0], ttt_board[3], ttt_board[6]],
								[ttt_board[1],ttt_board[4], ttt_board[7]],
								[ttt_board[2],ttt_board[5],ttt_board[8]], 
								[ttt_board[0], ttt_board[4], ttt_board[8]],
								[ttt_board[2],ttt_board[4],ttt_board[6]]]
		
		winning_combinations.each do |winner|
			winning_move = winner.count(marker) == 2
		end

		winning_combinations.each do |loser|
			block_move = loser.count(opponent_marker) == 2
		end

		if winning_move.each do |board_marker|
				if board_marker == " "
			   		board_marker = marker
				end
			end
		elsif block_move.each do |board_marker|
				if board_marker == " "
					board_marker = marker
				end
			end
		else


		
	 
	end
end