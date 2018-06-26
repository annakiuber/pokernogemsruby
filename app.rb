require 'sinatra'
require_relative 'isbn.rb'
require_relative 'isbn_csv.rb'


enable :sessions

get '/' do 
	session[:mod_num] = ""
	erb :input_num
end

post '/input_num' do
	puts params
	num = params[:num]
	session[:mod_num] = num_length(num)
	p "this is modded num"
	puts session[:mod_num]
	redirect '/results?num=' + num
end

get '/results' do
	data_array = []
	num = params[:num]
	# p CSV.read("isbn_file.csv")
	data = CSV.read("isbn_file.csv")
	data.each do |isbn|
		p isbn
		data_array << isbn
	end
	data_array << [num, session[:mod_num]]
	csv_open(data_array)
	data = CSV.read("isbn_file.csv")
	erb :results, locals:{mod_num: session[:mod_num], num: num, data: data}
end

get '/redo' do
	erb :input_num
end

post 'final_results' do
	redirect '/final_results'
end

get '/final_results' do
	data_array = []
	num = params[:num]
	p CSV.read("isbn_file.csv")
	data = CSV.read("isbn_file.csv")
	erb :final_results, locals:{mod_num: session[:mod_num], num: num, data: data}
end


