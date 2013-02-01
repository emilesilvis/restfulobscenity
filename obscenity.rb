require 'sinatra'
require 'obscenity'
require 'json'
require 'open-uri'

configure do
	enable :sessions
end

before do
	Obscenity.configure do |config|
	  	config.replacement = :stars
	  	unless session[:blacklist].empty?
	  		config.blacklist = session[:blacklist]
	  	end
	end
end

get '/' do
	erb "Profanity filter based on obscenity gem"
end

get '/check/:sentence' do	
	return status, {'Content-Type' => 'application/json'}, {:profane => Obscenity.profane?(params[:sentence]) }.to_json
end

get '/clean/:sentence' do	
	return status, {'Content-Type' => 'application/json'}, {:cleaned_sentence => Obscenity.sanitize(params[:sentence])}.to_json
end

get '/blacklist' do
	return status, {'Content-Type' => 'text/yaml'}, session[:blacklist].to_yaml
end

get '/blacklist/:word' do
	session[:blacklist].push(params[:word])
	return status, {'Content-Type' => 'text/yaml'}, session[:blacklist].to_yaml
end

get '/cleanlist' do
	session[:blacklist] = []
	return status
end