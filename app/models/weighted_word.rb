class WeightedWord < ActiveRecord::Base
  include Comparable

  belongs_to :word_search, inverse_of: :weighted_words

  validates :word, presence: true
  validates :frequency, presence: true

  def <=>(other_word)
    other_word.frequency <=> frequency
  end
end
