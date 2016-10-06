require "minitest/autorun"
require_relative "class_unbeatable_ai.rb"

class TestUnbeatableAI < Minitest::Test

	def test_create_new_player
		player = UnbeatableAI.new("X")
		assert_equal("X", player.marker)
	end

	def test_win_spot_for_X
		player = UnbeatableAI.new("X")
		assert_equal(0, player.get_move([" ","X","X"," ","O","O"," "," "," "]))
		assert_equal(1, player.get_move(["X"," ","X"," ","O","O"," X"," ","O"]))
		assert_equal(7, player.get_move([" "," "," ","O"," ","O","X"," ","X"]))
		assert_equal(3, player.get_move(["X"," ","O"," ","O"," ","X"," ","O"]))
		assert_equal(3, player.get_move(["X","O","O"," ","O","X","X","X","O"]))
	end

	def test_win_spot_for_O
		player = UnbeatableAI.new("O")
		assert_equal(3, player.get_move([" ","X","X"," ","O","O"," "," "," "]))
		assert_equal(8, player.get_move(["O","X","O","X","O","X","X","O"," "]))
	end

	def test_blocking_oppenets_win
		player = UnbeatableAI.new("X")
		assert_equal(3, player.get_move([" ","X"," "," ","O","O"," "," "," "]))
		assert_equal(0, player.get_move([" ","O","O"," ","X"," "," ","X"," "]))
		assert_equal(6, player.get_move(["O","X","O","O"," ","X"," "," ","X"]))
	end

	def test_for_a_fork
		player = UnbeatableAI.new("X")
		assert_equal(0, player.get_move([" ","X"," "," ","X","O"," ","O"," "]))
		assert_equal(6, player.get_move([" ","O"," "," ","X","O"," ","X"," "]))
		# assert_equal(4, player.get_move([" "," "," "," "," "," "," "," "," "]))
		assert_equal(2, player.get_move(["O"," "," "," "," "," ","X","O","X",]))
	end

	def test_for_a_fork_2
		player = UnbeatableAI.new("O")
		assert_equal(1, player.get_move(["X"," "," "," "," "," ","X","O","X",]))
	end

	# def test_check_for_block_fork
	# 	player = UnbeatableAI.new("X")
	# 	assert_equal(1, player.get_move(["X"," "," "," ","O"," "," "," ","X"]))
	# end
end