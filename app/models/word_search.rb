require 'uri'

class WordSearch < ActiveRecord::Base
  has_many :weighted_words, inverse_of: :word_search, dependent: :destroy

  validates :weighted_words, length: { minimum: 1 }
  validates :url, presence: true

  delegate :heaviest,
           :top_ten, to: :weighted_words

  def top_weighted_word
    heaviest.word
  end

  def top_weighted_frequency
    heaviest.frequency
  end
end
