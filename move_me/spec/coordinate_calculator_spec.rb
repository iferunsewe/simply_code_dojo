require 'spec_helper'

describe CoordinateCalculator do
  coordinates_and_direction = {x:1, y: 2, direction: "N"}
  context 'when the instruction is right' do
    it 'changes direction to the right' do
      cc = described_class.new(coordinates_and_direction.merge instructions: 'R')
      cc.calculate_instructions
      expect(cc.direction).to be eq((cc.send :r_rules).to_s.upcase)
    end
  end
end
