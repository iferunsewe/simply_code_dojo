class CoordinateCalculator
  attr_reader :x, :y, :direction
  def initialize(first_input, instructions)
    @x = first_input[:x]
    @y = first_input[:y]
    @direction = first_input[:direction]
    @instructions = instructions
  end

  def calculate_instructions
    split_instructions = @instructions.split('')
    split_instructions.each do |ins|
      if ins == 'L'
        l_move
      elsif ins == 'R'
        r_move
      else
        g_move
      end
    end
  end

  private

  def g_move
    if @direction == 'N' || @direction == 'S'
      @y = g_rules[format_direction(@direction)]
    else
      @x = g_rules[format_direction(@direction)]
    end

  end

  def r_move
    @direction = r_rules[format_direction(@direction)].to_s.upcase
  end

  def l_move
    @direction = l_rules[format_direction(@direction)].to_s.upcase
  end

  def g_rules
    {n: @y + 1, s: @y - 1, e: @x + 1, w: @x - 1}
  end

  def r_rules
    {n: :e, s: :w, e: :s, w: :n}
  end

  def l_rules
    {n: :w, s: :e, e: :n, w: :s}
  end

  def instruction_rules
    {G: g_move, R: r_move, L: l_move}
  end

  def format_direction(direction)
    direction.downcase.to_sym
  end
end