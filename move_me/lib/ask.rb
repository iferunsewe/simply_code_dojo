class Ask
  attr_reader :first_input, :instructions

  def initialize
    @first_input = {}
    @instructions = ''
  end

  def coordinates_and_direction
    ask_x_coordinate
    ask_y_coordinate
    ask_direction
  end

  def for_instructions
    ask_instructions
  end


  def ask_x_coordinate
    puts 'Enter the x coordinate: '
    first_input[:x] = gets.to_i
  end

  def ask_y_coordinate
    puts 'Enter the y coordinate: '
    first_input[:y] = gets.to_i
  end

  def ask_direction
    puts 'Enter the direction: '
    directions = ['N', 'S', 'E', 'W']
    first_input[:direction] = gets.delete("\n")
    until directions.include?(first_input[:direction])
      puts "Direction must be one of the following: #{directions.join(',')}"
      ask_direction
    end
  end

  def ask_instructions
    puts 'Enter the instructions:'
    set_instructions = ['G', 'R', 'L']
    @instructions = gets.delete("\n")

    until !@instructions.split('').any?{|i| !set_instructions.include?(i)}
      puts "Instructions must be either L, R, G!"
      ask_instructions
    end
  end
end