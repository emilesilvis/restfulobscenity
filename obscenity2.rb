require 'sinatra'
require 'obscenity'
require 'json'
require 'yaml'
require 'open-uri'

configure do
	enable :sessions
end

get '/' do
	 '?list'
end

get '/check/:sentence' do
	Obscenity.configure do |config|
		config.blacklist = YAML.load(open(params[:list]))
		config.replacement = :garbled
	end	
	return status, {'Content-Type' => 'application/json'}, {:profane => Obscenity.profane?(params[:sentence]) }.to_json
end

get '/clean/:sentence' do
	Obscenity.configure do |config|
		config.blacklist = YAML.load(open(params[:list]))
		config.replacement = :garbled
	end		
	return status, {'Content-Type' => 'application/json'}, {:cleaned_sentence => Obscenity.sanitize(params[:sentence])}.to_json
end