require './counting_sheep'

describe CountingSheep do

  describe '#process' do
    it 'returns INSOMNIA when processing 0' do
      expect(subject.process 0).to eq 'INSOMNIA'
    end

    it 'returns 10 when processing 1' do
      expect(subject.process 1).to eq 10
    end

    it 'returns 90 when processing 2' do
      expect(subject.process 2).to eq 90
    end

    it 'returns 110 when processing 11' do
      expect(subject.process 11).to eq 110
    end

    it 'returns 5076 when processing 1692' do
      expect(subject.process 1692).to eq 5076
    end

    it 'correctly tracks seen unique digits' do
      subject.process 1
      expect(subject.seen_numbers).to eq [1,2,3,4,5,6,7,8,9,0]
    end
  end

  describe '#load' do
    it 'converts file into an array' do
      expect(subject.load('spec/list.txt')).to be_instance_of(Array)
    end

    it 'creates a list entry for each line in the file' do
      expect(subject.load('spec/list.txt').count).to eq 3
    end

    it 'converts list items into integers' do
      expect(subject.load('spec/list.txt')).to eq [0, 1, 2]
    end
  end

end
