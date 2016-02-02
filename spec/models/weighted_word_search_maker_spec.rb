require 'spec_helper'

describe WeightedWordSearchMaker do
  let(:words_collection) { [] }
  let(:words) { %w(at bat sat cat) }
  let!(:word_search) { WordSearch.create(url: 'http://chaeokeefe.com') }
  before { create_words_collection }
  subject(:weighted_word_search_maker) { described_class.new(words: words_collection,
                                                             word_search: word_search) }

  describe '#make_weighted_words' do
    it 'creates a weighted word for each unique word' do
      expect{ weighted_word_search_maker.make_weighted_words }
        .to change{ WeightedWord.count }.by words.size
    end

    it 'associates weighted words with the given word search' do
      weighted_word_search_maker.make_weighted_words
      word_search.reload
      expect(word_search.weighted_words.size).to eq words.size
    end
  end

  private

  def create_words_collection
    words.each_with_index do |word, index|
      (index+1).times { words_collection << word }
    end
  end
end
