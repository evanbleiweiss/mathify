# Sample code borrowed from https://github.com/Mercurius3/vrijewadlopers/blob/master/config/data.rb
# 
# class Calendar < Sequel::Model
#   calenders = database[:calendars]
#   calenders.delete
#
#   many_to_one :tour
# end
#
# class Tour < Sequel::Model
#   tours = database[:tours]
#   tours.delete
#
#   one_to_many :calendars
# end
#
# def createTour(info,dates)
#   tour = Tour.create(info)
#   dates.each do |date,info|
#     calendar = Calendar.create(:date => date, :info => info)
#     tour.add_calendar(calendar)
#     calendar.save
#   end
#   tour.save
# end

# Generate problems for evaluation
# Problems can match on one or more problem categories

PROBLEM_CATEGORIES = ['Addition', 'Subtraction', 'Multiplication', 'Division', 'Primes']
DIFFICULTY_LEVELS = { 'easy' => [2, 10], 'medium' => [3, 10], 'hard' => [3, 100], 'tough' => [3, 1000] }
MULTIPLICATION_AIDE = {'hint0'=>'If you have at least one even operand, your product will be even. 
	If you have two odd operands, your product will be odd.', 'hint1'=> 'If an operand is multiplied by 0, the product will be 0',
'hint2'=> 'If an operand is multiplied by 1, the product will remain as the original operand', 'hint3'=>''}

SUBTRACTION_AIDE= {'hint0' => 'Subtracting two even numbers will yield anyother even number', 'hint1' => 'Taking 0 from a number will 
	leave you with the same number', 'hint2' => 'If both operands are equal, you are taking away everything'}

DIVISION_AIDE = {'hint0' => 'Any number divided by 1, will stay the same', 'hint1'=> 'If you divide 1 by a number, you will have a very small number less than 0',}

ADDITION_AIDE ={'hint0' => 'If you add 0 to any number, you are left with the same number', 'hint1'=> 'Two even numbers yield an even number. Two odd
	numbers yield an even number. One even and one odd number will yield an odd number'}

PRIME_NUMBER = {'hint0' =>'0,1 are not primes', 'hint1'=> '2 is the only even prime number', 'hint2' => 'there are inifinite number of primes',
'hint3'=> 'A prime number is only divisble by 1 and itself'}


class Problem
  def initialize difficulty_level: 'easy', category: 'addition', known_operands: []
    @known_operands = known_operands 
    @difficulty_level = set_difficulty(difficulty_level)
    @category = category || ''
  end

  def set_difficulty(level)
      # DIFFICULTY_LEVELS.has_key?(difficulty)
      @difficulty_level = DIFFICULTY_LEVELS[level]
  end 

  def generate_problem
    @operands =  []
    # @operands << @known_operands
    number_of_variables.times { @operands << rand(@difficulty_level.last) }
    # @operands.flatten
    format_question
  end

  def number_of_variables
    @difficulty_level.first
  end

  def question_generator
  end

  def compute_result(@operands,@category)
    send(@category, @operands)
  end
end

class Multiply < Problem
  def initialize *args
    super
    @category = 'multiplication'
  end

  def format_question
    @operands.join(" * ")
  end

  def multiply(numbers)
    numbers.inject(&:*)
  end
end

class Addition < Problem

  def addition(operands)
    operands.inject(&:+)
  end

end

class Subtract < Problem
	
  def subtraction(operands)
    operands.inject(&:-)
  end

end

class Divide < Problem

  def division(operands)
    operands.inject(&:/)
  end

end

class Exponent < Problem

  def exponents(operands)
    operands.inject(&:**)
  end

end

class Prime < Problem

  def primes(operands)
    n = operands.first
    result = false
    #find whether or not n is divisble by anyother numbers
    if(n==2)
      result = true		
    end
    (3...n).to_a.each do |i|
      if(n%i==0)			
        result =false
      else
        result = true
      end
    end
     result
  end	
end
#if the student answers incorrectly a problem, does this make more sense. Make the hash and in the method say if !correct then take 
#from this hash.

