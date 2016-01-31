require 'spec_helper'

describe WordWeigher do
  let(:words_collection) { [] }
  let(:words) { %w(at bat sat cat) }
  before { create_words_collection }
  subject(:word_weigher) { described_class.new(words: words_collection) }

  describe '#weighted_words' do
    subject(:weighted_words) { word_weigher.weighted_words }

    it 'creates a weighted word for each unique word' do
      expect(weighted_words.size).to eq words.uniq.size
    end
  end

  private

  def create_words_collection
    words.each_with_index do |word, index|
      (index+1).times { words_collection << word }
    end
  end
end
