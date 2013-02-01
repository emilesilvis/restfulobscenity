require 'sinatra'
require 'obscenity'
require 'json'
require 'yaml'
require 'open-uri'

configure do
	enable :sessions
end

before do
	Obscenity.configure do |config|
	  	unless session[:blacklist].nil? 
		  	unless session[:blacklist].empty?
		  		config.blacklist = session[:blacklist]
		  		config.replacement = :stars
		  	end
		end
	end
end

get '/' do
	"Profanity filter based on obscenity gem"
end

get '/check/:sentence' do	
	return status, {'Content-Type' => 'application/json'}, {:profane => params[:sentence] + ' : ' + Obscenity.profane?(params[:sentence]) }.to_json
end

get '/clean/:sentence' do	
	return status, {'Content-Type' => 'application/json'}, {:cleaned_sentence => Obscenity.sanitize(params[:sentence])}.to_json
end

get '/blacklist' do
	unless session[:blacklist].nil?
		return status, {'Content-Type' => 'text/yaml'}, session[:blacklist].to_yaml
	end
end

get '/blacklist/:word' do
	unless session[:blacklist].nil?
		session[:blacklist].push(params[:word])
	else
		session[:blacklist] = []
		session[:blacklist].push(params[:word])
	end
	return status, {'Content-Type' => 'text/yaml'}, session[:blacklist].to_yaml
end

get '/reset' do
	session[:blacklist] = nil
	return status
end