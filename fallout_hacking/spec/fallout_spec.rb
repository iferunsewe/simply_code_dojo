require_relative '../fallout'

describe Fallout do
  it "by default has a complexity of 1" do
    Fallout.new.get_complexity == 1
  end

 it "does not allow a large complexity value" do
    expect {  Fallout.new(16) }.to raise_error(ArgumentError)
  end

 it "does not allow a small complexity value" do
    #Fallout.new(-1).get_complexity == 1
    expect {  Fallout.new(-1) }.to raise_error(ArgumentError)
  end

end