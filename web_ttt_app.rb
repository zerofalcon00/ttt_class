require "sinatra"
require 'rubygems'
require "csv"
require 'aws/s3'
require_relative "sequential_ai.rb"
require_relative "random_ai.rb"
require_relative "human.rb"
require_relative "board.rb"
require_relative "local_env.rb"
#load "./local_env.rb" if File.exists?("./local_env.rb")


enable :sessions

get "/" do
	erb :ask_to_play
end

post "/output" do
	session[:board] = Board.new
	p1_name = params[:player_1]
	session[:p1] = Human.new("X", p1_name)
	# player_2 = params[:player_2]


	# if player_1 == "human"
	# 	session[:p1] = Human.new("X")	
	# elsif player_1 == "sequential_ai"
	# 	session[:p1] = SequentialAI.new("X")	
	# else player_1 == "random_ai"
	# 	session[:p1] = RandomAI.new("X")	
	# end

	# if player_2 == "human"
	# 	session[:p2] = Human.new("O")
	# elsif player_2 == "sequential_ai"
	# 	session[:p2] = SequentialAI.new("O")	
	# else player_2 == "random_ai"
	# 	session[:p2] = RandomAI.new("O")	
	# end

	session[:current_player] = session[:p1]

	redirect '/get_p2'
	# erb :get_move, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}
end

get '/get_p2' do
	erb :get_p2
	# player_2 = params[:player_2]
	# if player_2 == "human"
	# 	erb :get_p2_name
	# else
	# 	name = "CPU"
	# 	session[:p2] = RandomAI.new("O", name)
	# 	redirect '/get_move'
	# end
end

post '/get_p2' do
	player_2 = params[:player_2]
	if player_2 == "human"
		erb :get_p2_name
	else
		user = "CPU"
		session[:p2] = RandomAI.new("O", user)
		redirect '/get_move'
	end
end

post '/get_p2_name' do
	p2_name = params[:player_2]
	session[:p2] = Human.new("O", p2_name)
	redirect '/get_move'
end


get "/get_move" do
	
	move = session[:current_player].get_move(session[:board].ttt_board)
	if move == "no"
		erb :get_move, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}
	elsif session[:board].valid_spot?(move)
		redirect '/make_move?move=' + move.to_s
	else
		redirect '/get_move'
	end
end

post '/get_move' do
	move = params[:move_spot].to_i

	if session[:board].valid_spot?(move)
		redirect '/make_move?move=' + move.to_s
	else
		redirect '/get_move'
	end


end

# get '/make_move' do
# 	move = params[:move]
# 	move_spot = params[:board]
# 	#update board with move
# 	#



get "/make_move" do
	
		
		move = params[:move].to_i


	
	session[:board].update_board((move - 1), session[:current_player].marker)
	
	if session[:board].check_for_win?(session[:current_player].marker) == true
		date_time = DateTime.now
		p1 = "#{session[:p1].name}"
		p2 = "#{session[:p2].name}"
		winner = "#{session[:current_player].name}"
		write_file_to_s3(p1, p2, winner, date_time)
		# write_to_csv(p1, p2, winner, date_time)
		redirect "/win?current_player=session[:current_player]"
	elsif session[:board].check_for_tie? == true
		date_time = DateTime.now
		p1 = "#{session[:p1].name}"
		p2 = "#{session[:p2].name}"
		winner = "#{session[:current_player].name}"
		write_to_csv(p1, p2, winner, date_time)

		redirect "/tie"
	else
		if session[:current_player].marker == "X"
			session[:current_player] = session[:p2]
		else
			session[:current_player] = session[:p1]
		end
		
		# erb :get_move, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}
		redirect '/get_move'

	end

	# if session[:current_player].marker == "X"
	# 	session[:current_player] = session[:p2]
	# else
	# 	session[:current_player] = session[:p1]
	# end
	# # board_with_positions
	 erb :get_move, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}

end

# get '/upload' do
#   winning_results = 'summary.csv'
  
#   # erb :scores, locals => {:winning_results => winning_results}

# end

get "/win" do
	erb :win, :locals => {:current_player => session[:current_player]}
end

get "/tie" do
	"The game is a TIE"
end

get '/update_csv' do
	# csv = create_result_array(read_csv_from_s3)
	names = create_result_array(read_csv_from_s3)
	names.shift

	erb :update_csv, :locals => {:names => names}
end


def write_to_csv(player_1, player_2, winner, date_time)
	CSV.open("summary.csv", "a") do |csv|
		csv << ["#{player_1}" + ", " + "#{player_2}" + ", " + "#{winner}" + ", " + "#{date_time}"]
	end
end

def write_file_to_s3(p1, p2, winner, date_time)
	# AWS::S3::S3Object.store(
	#     data_to_write, 
	#     'tic-tac-toe-class',
	#     :access => :public_read)
	#s3 = AWS::S3::Resource.new
	#s3.bucket('tic-tac-toe-class').object(:access_key_id).upload_file('summary.csv')
AWS::S3::Base.establish_connection!(
  :access_key_id => ENV['S3_KEY'],
  :secret_access_key => ENV['S3_SECRET']   
)
file = "summary.csv" 
bucket = 'ttt-class'
csv = AWS::S3::S3Object.value(file, bucket)
csv << p1 + ", " + p2 + ", " + winner + ", " + date_time.to_s + "\n"
AWS::S3::S3Object.store(File.basename(file), 
                        csv, 
                        bucket, 
                        :access => :public_read)
end		

def read_csv_from_s3
	file = 'summary.csv'
	bucket = 'ttt-class'
	object_from_s3 = AWS::S3::S3Object.value(file, bucket)
	# csv = CSV.parse(object_from_s3)
	object_from_s3
	# file = File.open('summary.csv', "r")
	# contents = file.read
	#  name_of_output_file = "summary2.csv"
	#  write_to_file = File.open(name_of_output_file, "w")
	#  write_to_file.puts contents
	#  write_to_file.close
	# contents
end	

def create_result_array(content)
	file = content
	result = file.split("\n")
	array = Array.new
	result.each { |x| array.push(x.split(":"))}
	array
end
