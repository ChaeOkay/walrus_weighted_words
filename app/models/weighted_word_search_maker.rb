class WeightedWordSearchMaker
  attr_reader :words_map, :word_search
  private :words_map, :word_search

  def initialize(word_search:, words_map:)
    @words_map = words_map
    @word_search = word_search
  end

  def make_weighted_words
    ActiveRecord::Base.transaction do
      words_map.map do |word, frequency|
        word_search.weighted_words.build(word: word, frequency: frequency)
      end
      word_search.save
    end
  end
end
