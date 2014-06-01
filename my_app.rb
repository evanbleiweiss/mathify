# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
#
# $ ruby heroku-sinatra-app.rb
#
require 'rubygems'
require 'sinatra'
require 'haml'
require 'pry'

require './config/init.rb'

get '/' do
  haml :index
end

get '/problem' do 
  # content_type :json
  @problem = Multiply.new(difficulty_level: 'medium')
  # @problem.to_json
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
