#require 'pry'

def compute_result(@operands,@category)
	send(@category, @operands)
end

def question_generator

def addition(operands)
	operands.inject(&:+)
end
	
def subtraction(operands)
	operands.inject(&:-)
end

def division(operands)
	operands.inject(&:/)
end

def exponents(operands)
	operands.inject(&:**)
end

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
#if the student answers incorrectly a problem, does this make more sense. Make the hash and in the method say if !correct then take 
#from this hash.

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


