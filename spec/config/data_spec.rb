require File.dirname(__FILE__) + '/../spec_helper'

describe Problem do
  context 'A new problem' do
    specify { expect(subject.instance_variable_get(:@known_operands)).to eq([]) }

    specify { expect(subject.instance_variable_get(:@difficulty_level)).to eq('easy') }
    specify { expect(subject.instance_variable_get(:@operator)).to eq('addition') }
  end

  context 'Setting problem constraints' do
    subject { Problem.new(difficulty_level: 'medium') }

    it { expect(subject).to be_instance_of Problem }

    describe '.operand_generator' do
      context 'with known_operands' do
        let(:problem) { Problem.new(difficulty_level: 'medium', known_operands: [3,4]) }
        let(:with_numbers) { problem.operand_generator }
        subject { problem }

        specify { expect(subject.instance_variable_get(:@known_operands)).to match_array([3, 4]) }

        before { with_numbers }
        it 'pushes known operands into the operands array' do
          expect(subject.instance_variable_get(:@operands)).to include(3,4)
        end

        it 'pushes known operands into the operands array' do
          expect(subject.instance_variable_get(:@operands).length).to eq(3) 
        end
          
      end
      
      context 'without known_operands' do
        it 'creates the appropriate number of operands' do
          subject.operand_generator
          expect(subject.instance_variable_get(:@operands).length).to eq(3)
        end
      end
    end
  end

  describe '.subtraction' do
    let(:operator) { 'subtraction' }
    it 'uses the specified operator'
    it {}
  end
end

