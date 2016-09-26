class ConsoleAI
	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		puts "pick a space"
		move = gets.chomp.to_i
		if board[move] ==  " "
			move
		else
			puts "invalid space"
			get_move(board)
		end
	end


end