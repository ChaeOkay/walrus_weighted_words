class WordWeigher
  attr_reader :words
  private :words

  def initialize(words:)
    @words = words
  end

  def weighted_words
    Hash[words_and_frequencies_list]
  end

  private

  def words_and_frequencies_list
    # nested array, word then frequency
    #  => [['cat', 3]]
    words_map.map { |word, words_list| [ word, words_list.size] }
  end

  def words_map
    # key is word, value is an array of each word occurnce
    #   => { "cat" => ["cat", "cat", "cat] }
    words.group_by { |word| word }
  end
end
