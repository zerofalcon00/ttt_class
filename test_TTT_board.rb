require "minitest/autorun"
require_relative "board.rb"

class TestBoard < Minitest::Test
	def test_new_board_created
		board = Board.new(3)
		assert_equal([" "," "," "," "," "," "," "," "," "], board.ttt_board)
	end

	def test_new_board_created2
		board = Board.new(4)
		assert_equal([" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "], board.ttt_board)
	end

	def test_new_board_created3
		board = Board.new(27)
		assert_equal(27 * 27, board.ttt_board.count)
	end

	# def test_update_new_board_with_X_at_index_position_0
	# 	board = Board.new()
	# 	board.update_board(0, "X")
	# 	assert_equal(["X"," "," "," "," "," "," "," "," "], board.ttt_board)
	# end

	# def test_update_partially_full_board_with_O_at_index_position_4
	# 	board = Board.new()
	# 	board.ttt_board = ["X","O"," "," "," "," ","O"," ","X"]
	# 	board.update_board(4, "O")
	# 	assert_equal(["X","O"," "," ","O"," ","O"," ","X"], board.ttt_board)
	# end

	# def test_partially_full_board_if_index_is_valid
	# 	board = Board.new()
	# 	board.ttt_board = ["X","O"," "," "," "," ","O"," ","X"]
	# 	assert_equal(false, board.valid_spot?(0))
	# 	assert_equal(false, board.valid_spot?(15))
	# 	assert_equal(true, board.valid_spot?(3))
	# 	assert_equal(false, board.valid_spot?(-2))
	# end

	# def test_if_full_board_equals_a_tie_comes_back_true
	# 	board = Board.new()
	# 	board.ttt_board = ["X","O","X","O","O","X","O","O","X"]
	# 	assert_equal(true, board.check_for_tie?)
	# end

	# def test_if_board_equals_a_tie_comes_back_false
	# 	board = Board.new()
	# 	board.ttt_board = [" ","O","X","O","O","X","O","O","X"]
	# 	assert_equal(false, board.check_for_tie?)
	# end

	# def test_for_a_win_with_X
	# 	board = Board.new()
	# 	board.ttt_board = ["X","O","X","X","O","O","X","X","O"]
	# 	marker = "X" 
	# 	assert_equal(true, board.check_for_win?(marker))
	# end

	# def test_for_a_win_with_O
	# 	board = Board.new()
	# 	board.ttt_board = ["X","O","X","O","O","O","O","O","X"]
	# 	marker = "O" 
	# 	assert_equal(true, board.check_for_win?(marker))
	# end

	# def test_for_a_win_with_xs
	# 	board = Board.new()
	# 	board.ttt_board = ["O","O","X","X","O","X","X","O","X"]
	# 	marker = "X" 
	# 	assert_equal(true, board.check_for_win?(marker))
	# end

	# def test_for_a_win_returns_false
	# 	board = Board.new()
	# 	board.ttt_board = ["O","X","O","X","O","X","X","O","X"]
	# 	marker = "O" 
	# 	assert_equal(false, board.check_for_win?(marker))
	# end

	# def test_for_a_win_returns_false1
	# 	board = Board.new()
	# 	board.ttt_board = ["O","O","O","O","O","O","X","O","X"]
	# 	marker = "X" 
	# 	assert_equal(false, board.check_for_win?(marker))
	# end

	# def test_board_with_positions
	# 	board = Board.new()

	# 	assert_equal([1,2,3,4,5,6,7,8,9], board.board_with_positions)
	# end

	# def test_board_with_markers
	# 	board = Board.new
	# 	board.ttt_board = [" ","X"," "," "," ","O"," "," "," "]
	# 	assert_equal([1,"X",3,4,5,"O",7,8,9], board.board_with_positions)
	# end

	# def test_valid_spot
	# 	board = Board.new
	# 	move = 1
	# 	board.ttt_board = [" ","X"," "," "," ","O"," "," "," "]
	# 	assert_equal(true, board.valid_spot?(move))
	# end
end