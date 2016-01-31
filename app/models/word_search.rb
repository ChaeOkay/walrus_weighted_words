class WordSearch < ActiveRecord::Base
  validates :url,
    presence: true,
    url: true

  def top_ten_weighted_words
    weighted_words[0..9]
  end

  def top_weighted_word
    heaviest_weighted_word.word
  end

  def top_weighted_frequency
    heaviest_weighted_word.frequency
  end

  private

  def words
   # words (hstore?) or the xml can be saved to WordSearch pg table,
   # not sure what the best caching situation is yet
    UrlWords.new(url: url).all
  end

  def heaviest_weighted_word
    weighted_words.first
  end

  def weighted_words
    @weighted_words ||= WordWeigher.new(words: words).weighted_words
  end
end
