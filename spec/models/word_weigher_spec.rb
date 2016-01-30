require 'spec_helper'

describe WordWeigher do
  let(:words_collection) { [] }
  let(:words) { %w(at bat sat cat rat mat tap pat lap gnat stat) }
  before { create_words_collection }
  subject(:word_weigher) { described_class.new(words: words_collection) }

  describe '#weighted_words' do
    subject(:weighted_words) { word_weigher.weighted_words }

    it 'returns hash of words ordered by frequncy of occurence' do
      expect(weighted_words["at"]).to eq 1
      expect(weighted_words["bat"]).to eq 2
      expect(weighted_words["stat"]).to eq 11
    end
  end

  private

  def create_words_collection
    words.each_with_index do |word, index|
      (index+1).times { words_collection << word }
    end
  end
end
