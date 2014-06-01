# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
require 'rubygems'
require 'sinatra'

# This app requires
require 'haml'
require 'json'
require 'pry'

require './config/init.rb'

get '/' do
  haml :index
end

get '/problem.json' do 
  content_type :json
  @problem = Multiply.new(difficulty_level: 'medium', known_operands: [3])
  # binding.pry
  # { :key1 => 'value1', :key2 => 'value2' }.to_json
  # @problem.to_a.map { |k,v| { k: v} }.to_json 
  @problem.to_json 
end

get '/problem' do
  haml :problem
end

get '/difficulty' do
  haml :difficulty
end

post '/difficulty' do
  Problem.set_difficulty(params[:difficulty])
end

# Test at <appname>.heroku.com

# You can see all your app specific information this way.
# IMPORTANT! This is a very bad thing to do for a production
# application with sensitive information

# get '/env' do
#   ENV.inspect
# end
