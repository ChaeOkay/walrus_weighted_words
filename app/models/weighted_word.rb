class WeightedWord
  include Comparable
  attr_reader :word, :frequency

  def initialize(word:, frequency:)
    @word = word
    @frequency = frequency
  end

  def <=>(other_word)
    other_word.frequency <=> frequency
  end
end
