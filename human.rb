class Human
	attr_reader :marker, :name

	def initialize(marker, user)
		@name = user
		@marker = marker
	end

	def get_move(board)
		"no"
	end
end
