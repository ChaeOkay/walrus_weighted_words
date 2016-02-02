require 'uri'

class WordSearch < ActiveRecord::Base
  has_many :weighted_words, inverse_of: :word_search, dependent: :destroy

  validates :weighted_words, length: { minimum: 1 }
  validates :url, presence: true

  def valid_url?
    valid?
    parsable_url? ? true : invalid_url_error
  end

  def top_ten_weighted_words
    weighted_words.top_ten
  end

  def top_weighted_word
    heaviest_weighted_word.word
  end

  def top_weighted_frequency
    heaviest_weighted_word.frequency
  end

  def weigh_url_words
    WeightedWordSearchMaker.new(words: url_words, word_search: self)
      .make_weighted_words
  end

  private

  def invalid_url_error
    self.errors[:url] << I18n.t('word_search.errors.url')
    false
  end

  def parsable_url?
    parsed_url = URI.parse(url)
    parsed_url.kind_of?(URI::HTTP) || parsed_url.kind_of?(URI::HTTPS)
  end

  def heaviest_weighted_word
    weighted_words.sorted_by_frequency.first
  end

  def url_words
    UrlWords.new(url: url).all
  end
end
