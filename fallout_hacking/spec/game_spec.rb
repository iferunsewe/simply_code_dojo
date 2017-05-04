require "game"

describe Game do

  it "responds to #guess" do
    expect(subject).to respond_to(:guess).with(1).argument
  end

  it "is initialised with a difficulty level" do
    easy_game = Game.new(:easy)
    expect(easy_game.difficulty).to eq :easy
  end

  describe "#pick_words" do
    it "picks 5 words when difficulty is easy" do
      easy_game = Game.new(:easy)
      easy_game.pick_words
      expect(easy_game.word_list.count).to eq 5
    end

    it "picks 7 words when difficulty is medium" do
      medium_game = Game.new(:medium)
      medium_game.pick_words
      expect(medium_game.word_list.count).to eq 7
    end

    it "picks 9 words when difficulty is hard" do
      hard_game = Game.new(:hard)
      hard_game.pick_words
      expect(hard_game.word_list.count).to eq 9
    end

    it "picks words of length 6" do
      easy_game = Game.new(:hard)
      easy_game.pick_words
      easy_game.word_list.each do |word|
        expect(word.length).to eq 6
      end
    end
  end
end
