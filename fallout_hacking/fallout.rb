require 'securerandom'

class Fallout  

  attr_reader :refined_list

  def initialize(complexity = 1, wordlist = ['hello', 'world'])  
 
    @complexity = set_complexity(complexity)
    @wordlist = wordlist  
    refine_wordlist complexity
    set_word
  end  

  def refine_wordlist(complexity)

  	complexity_match = {'1' => 4..6, '2' => 7..9, '3' => 10..12, '4' => 13..14, '5' => 15 }
  	number_range = complexity_match[complexity.to_s]
  	
  	@refined_list = @wordlist.select { |word|
  		number_range.include?(word.length)
  	 }.sample(15)

  end

  def set_word
  	word_index = SecureRandom.random_number @refined_list.length
  	@current_word = @refined_list[word_index]
  	@split_word = @current_word.split('')
  end

  def set_complexity(complexity)
  	raise ArgumentError.new('invalid complexity value') if complexity < 1 || complexity > 15
  	complexity
  end

  def get_complexity
  	@complexity
  end

  def display  
    puts "Using a complexity of #{@complexity}. The current word is #{@current_word}."  
  end  

  def evaluate_guess(guess = '')
  	#require 'pry'
  	#binding.pry

  	w1 = guess.split('')
  	result = @split_word.zip(w1).map { |x, y| x == y }

  	{"result" =>  result.all?, "correct" =>  result.count(true), "incorrect" => result.count(false) }

  end

end  