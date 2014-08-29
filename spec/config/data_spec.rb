require File.dirname(__FILE__) + '/../spec_helper'

describe Problem do
  context 'A new problem' do
    subject { Problem.new }

    it 'starts with an empty set of (operands)' do
      expect(subject.instance_variable_get(:@known_operands)).to eq([])
    end

    specify { expect(subject.instance_variable_get(:@difficulty_level)).to eq('easy') }
  end

  context 'Setting problem constraints' do
    subject { Problem.new(difficulty_level: 'medium', known_operands: [3,4]) }

    specify { expect(subject.instance_variable_get(:@known_operands)).to match_array([3, 4]) }
    
    specify { expect(subject.instance_variable_get(:@difficulty_level)).to eq('medium') }

  end

  describe "creating a problem set" do
    it 'has a difficulty level'
    it 'uses the specified operator'
  end
end

