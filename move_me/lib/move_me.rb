require_relative 'coordinate_calculator'
require_relative 'ask'

ask = Ask.new

ask.coordinates_and_direction
ask.for_instructions

cc = CoordinateCalculator.new(ask.first_input, ask.instructions)
cc.calculate_instructions

puts "X: #{cc.x}, Y: #{cc.y}, Direction: #{cc.direction}"
