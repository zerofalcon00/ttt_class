require "sinatra"
require_relative "sequential_ai.rb"
require_relative "random_ai.rb"
require_relative "human_ai.rb"
require_relative "board.rb"

enable :sessions

get "/" do
	erb :ask_to_play
end

post "/output" do
	session[:board] = Board.new
	player_1 = params[:player_1]
	player_2 = params[:player_2]

	if player_1 == "console_ai"
		session[:p1] = HumanAI.new("X")	
	elsif player_1 == "sequential_ai"
		session[:p1] = SequentialAI.new("X")	
	else player_1 == "random_ai"
		session[:p1] = RandomAI.new("X")	
	end

	if player_2 == "console_ai"
		session[:p2] = HumanAI.new("O")
	elsif player_2 == "sequential_ai"
		session[:p2] = SequentialAI.new("O")	
	else player_2 == "random_ai"
		session[:p2] = RandomAI.new("O")	
	end

	session[:current_player] = session[:p1]

	erb :get_move, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}
end

get "/get_move" do
	erb :get_move
end

post "/get_player_move" do
	# if session[:current_player] == ConsoleA
		move_spot = params[:move_spot].to_i
	# else session[:current_player] == SequentialAI.new
	# 	move_spot = session[:current_player].get_move.to_i
	# end

	session[:board].update_board((move_spot - 1), session[:current_player].marker)
	if session[:board].check_for_win?(session[:current_player].marker) == true
		redirect "/win?current_player=session[:current_player]"
	elsif session[:board].check_for_tie? == true
		redirect "/tie"
	else
		if session[:current_player].marker == "X"
			session[:current_player] = session[:p2]
		else
			session[:current_player] = session[:p1]
		end
		
		erb :get_move, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}

	end

	# if session[:current_player].marker == "X"
	# 	session[:current_player] = session[:p2]
	# else
	# 	session[:current_player] = session[:p1]
	# end
	# # board_with_positions
	# erb :get_move, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}

end

get "/win" do
	"#{session[:current_player].marker} is the WINNER"
end

get "/tie" do
	"The game is a TIE"
end

	

