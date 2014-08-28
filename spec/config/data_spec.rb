require File.dirname(__FILE__) + '/../spec_helper'

describe Problem do
  subject do
    Problem.new
  end

  it 'returns a set of numbers for use (operands)' do
    expect(@known_operands.kind_of?(Array)).to be_true 
  end

  it 'accepts known numbers for use' do
  end

  describe "creating a problem set" do
    it 'has a difficulty level' do
    end
    it 'uses the right operator' do
    end
  end
end

