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
		session[:p1]= HumanAI.new("X")	
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

	erb :get_move, :locals => {:player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}
end

get "/get_move" do
	erb :get_move
end

post "/get_player_move" do
	move_spot = params[:move_spot].to_i

	session[:board].update_board((move_spot - 1), session[:p1].marker)
	"#{session[:board].ttt_board}"
	# board_with_positions


end

