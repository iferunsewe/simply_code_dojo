class Game
  attr_reader :difficulty, :word_list

  def initialize(difficulty_level = :medium)
    @difficulty = difficulty_level
    @word_list = []
  end

  def guess(guessed_word)

  end

  def pick_words
    word_text_file = File.read("wordlist.txt").split("\n")
    # word_count = difficulty_word_count[difficulty]
    # @word_list = word_text_file[0..word_count]
    word_text_file.each do |word|
      if word.length == 6
        @word_list << word
      end
      return if @word_list.length == difficulty_word_count[difficulty]
    end
  end

  private

  def difficulty_word_count
    {easy: 5,
     medium: 7,
     hard: 9}
  end


end
