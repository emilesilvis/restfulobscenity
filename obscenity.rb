require 'sinatra'
require 'obscenity'
require 'json'
require 'yaml'
require 'open-uri'
require 'rdiscount'

configure do
	enable :sessions
end

get '/' do
	markdown :README
end

get '/use' do
	Obscenity.configure do |config|
		config.blacklist = YAML.load(open(params[:list]))
		config.replacement = :stars
	end	
end

get '/check' do
	return status, {'Content-Type' => 'application/json'}, {:profane => Obscenity.profane?(params[:sentence])}.to_json
end

get '/clean' do	
	return status, {'Content-Type' => 'application/json'}, {:cleaned_sentence => Obscenity.sanitize(params[:sentence])}.to_json
end