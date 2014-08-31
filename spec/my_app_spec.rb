require File.dirname(__FILE__) + '/spec_helper'

describe "Mathsosaurus" do
  include Rack::Test::Methods

  def app
    @app ||= Sinatra::Application
  end

  it "should respond to /" do
    get '/'
    expect(last_response).to be_ok
  end

  it 'responds to /problem' do
    get '/problem'
    expect(last_response).to be_ok
  end

  it 'accepts a problem type' do
    get '/problem/multiplication'
    expect(last_response).to be_ok
  end

  #this isn't a very good test
  it 'accepts a difficulty' do
    get '/problem/subtraction/hard'
    expect(last_response).to be_ok
  end
end
