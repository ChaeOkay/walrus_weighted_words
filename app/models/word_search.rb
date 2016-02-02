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

  private

  def invalid_url_error
    self.errors[:url] << I18n.t('word_search.errors.url')
    false
  end

  end

  def heaviest_weighted_word
    weighted_words.first
  end

  def weighted_words
    @weighted_words ||= WordWeigher.new(words: words).weighted_words
  end
end
