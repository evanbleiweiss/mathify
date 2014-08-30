# You'll need to require these if you
# want to develop while running with ruby.
# The config/rackup.ru requires these as well
# for it's own reasons.
require 'rubygems'
require 'sinatra'

# # This app requires
require "sinatra/json"
require 'haml'
require 'pry'
require "sinatra/reloader" if development?

require './config/init.rb'

get '/' do
  haml :index
end

#naive implementation for url routing, problem type
# get '/problem/subtract.?:format?' do 
#   @problem = Subtract.new(difficulty_level: 'medium', known_operands: [3])
#   @params[:format].eql?('json') ? json(@problem.generate_problem) : haml(:problem)
# end

get '/problem/:type/:difficulty/?' do
  @problem = Problem.new operator: params[:type], difficulty_level: params[:difficulty]
  @problem.operand_generator
  haml(:problem)
end

get '/problem/:type/?' do
  @problem = Problem.new operator: params[:type]
  @problem.operand_generator
  haml(:problem)
end

get '/problem/?' do
  @problem = Problem.new
  @problem.operand_generator
  haml(:problem)
end

get '/problem.json/:category' do
  @problem = Problem.new(operator: params[:type], difficulty_level: 'medium', known_operands: [3])
  json @problem.generate_problem
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
