class CountingSheep
  attr_reader :seen_numbers

  def initialize
    @seen_numbers = []
    @multiplier = 1
  end

  def load(file_path)
    f = File.read(file_path)
    f.split("\n").map(&:to_i)
  end

  def process(input)
    if input == 0
      'INSOMNIA'
    else
      while @seen_numbers.count < 10 do
        @current_number = input * @multiplier
        add_new_digits_to_seen_numbers
        @multiplier += 1
      end
      @current_number
    end
  end

private

  def add_new_digits_to_seen_numbers
    @current_number.to_s.split('').each do |string_digit|
      if !@seen_numbers.include? string_digit.to_i
        @seen_numbers << string_digit.to_i
      end
    end
  end

end
