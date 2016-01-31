class WordSearch < ActiveRecord::Base
  validates :url,
    presence: true,
    url: true

  def top_ten_weighted_words
    weighted_words.sort[0..9]
  end

  private

  def words
   # words (hstore?) or the xml can be saved to WordSearch pg table,
   # not sure what the best caching situation is yet
    UrlWords.new(url: url).all
  end

  def weighted_words
    WordWeigher.new(words: words).weighted_words
  end
end
