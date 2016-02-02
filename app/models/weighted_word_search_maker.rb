class WeightedWordSearchMaker
  attr_reader :words, :word_search
  private :words, :word_search

  def initialize(words:, word_search:)
    @words = words
    @word_search = word_search
  end

  def make_weighted_words
    ActiveRecord::Base.transaction do
      words_map.map do |word, word_list|
        word_search.weighted_words.build(word: word, frequency: word_list.size)
      end
      word_search.save
    end
  end

  private

  def words_map
    # key is word, value is an array of each word occurnce
    #   => { "cat" => ["cat", "cat", "cat] }
    words.group_by { |word| word }
  end
end
