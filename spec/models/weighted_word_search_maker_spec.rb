require 'spec_helper'

describe WeightedWordSearchMaker do
  let(:words_map) { { "health": 5, "finch": 1, "cool": 2 } }
  let!(:word_search) { WordSearch.new(url: 'http://chaeokeefe.com') }
  subject(:weighted_word_search_maker) { described_class.new(word_search: word_search,
                                                             words_map: words_map) }

  describe '#make_weighted_words' do
    it 'creates a weighted word for each unique word' do
      expect{ weighted_word_search_maker.make_weighted_words }
        .to change{ WeightedWord.count }.by words_map.size
    end

    it 'associates weighted words with the given word search' do
      weighted_word_search_maker.make_weighted_words
      word_search.reload
      expect(word_search.weighted_words.size).to eq words_map.size
    end
  end
end
