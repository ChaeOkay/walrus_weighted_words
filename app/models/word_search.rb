class WordSearch < ActiveRecord::Base
  validates :url,
    presence: true,
    url: true

# words (hstore?) or the xml can be saved to WordSearch pg table,
# not sure what the best caching situation is yet

  def words
    UrlWords.new(url: url).all
  end

  def weighted_words
    WordWeigher.new(words: words).weighted_words
  end
end
