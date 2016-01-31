class WordWeigher
  attr_reader :words, :weighted_word_factory
  private :words, :weighted_word_factory

  def initialize(words:, weighted_word_factory: WeightedWord)
    @words = words
    @weighted_word_factory = weighted_word_factory
  end

  def weighted_words
    words_map.map do |word, word_list|
      weighted_word_factory.new(word: word, frequency: word_list.size)
    end.sort
  end

  private

  def words_map
    # key is word, value is an array of each word occurnce
    #   => { "cat" => ["cat", "cat", "cat] }
    words.group_by { |word| word }
  end
end
