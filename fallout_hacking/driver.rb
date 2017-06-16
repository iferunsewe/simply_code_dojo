require_relative 'fallout'

puts 'Enter the complexity?'
complexity = gets.to_i

wordlist = File.read('./wordlist.txt').split

f = Fallout.new(complexity, wordlist)
f.display
puts f.refined_list

i = 1
num = 5

while i < num  do
	puts("Enter your guess: #{i} of #{num-1}" )
    guess = gets.gsub("\n",'')

	until f.refined_list.include?(guess) do
   	  puts("Not in list: Enter your guess: #{i} of #{num-1}" )
      guess = gets
    end

   result = f.evaluate_guess(guess)
   puts result

   break 'you won' if result["result"] 

	i += 1
    puts 'you lost'
   
end

