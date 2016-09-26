require "minitest/autorun"
require_relative "console_ai.rb"

class TestConsoleAI < Minitest::Test
	
	def test_for_new_player
		player = ConsoleAI.new("X")
		assert_equal("X", player.marker)
	end

	def test_console_available_space_returned
    	player = ConsoleAI.new("X")
    	move = player.get_move([" "," "," "," "," "," "," "," "," "])
        assert_equal(true, [0,1,2,3,4,5,6,7,8].include?(move))
    end



end
