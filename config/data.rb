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
