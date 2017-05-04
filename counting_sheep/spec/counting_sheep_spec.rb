require './counting_sheep'

describe CountingSheep do

  describe '#process' do
    it 'returns INSOMNIA when processing 0' do
      expect(subject.process 0).to eq "INSOMNIA"
    end
  end

end
