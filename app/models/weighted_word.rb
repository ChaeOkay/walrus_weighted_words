class WeightedWord < ActiveRecord::Base
  belongs_to :word_search, inverse_of: :weighted_words

  validates :word, presence: true
  validates :word_search, presence: true
  validates :frequency, presence: true

  scope :sorted_by_frequency, -> { order(frequency: :desc) }
  scope :top_ten, -> { sorted_by_frequency.first(10) }

  def self.heaviest
    self.sorted_by_frequency.first
  end
end
