require 'spec_helper'

describe WordSearch do
  let(:url) { 'http://www.chaeokeefe.com' }
  let(:weighted_word) { FactoryGirl.create(:weighted_word) }
  subject(:word_search) { described_class.new(url: url) }

  before do
    word_search.weighted_words << weighted_word
    word_search.save
  end

  describe '#top_weighted_word' do
    subject { word_search.top_weighted_word }
    it { is_expected.to eq weighted_word.word }
  end

  describe '#top_weighted_frequency' do
    subject { word_search.top_weighted_frequency }
    it { is_expected.to eq weighted_word.frequency }
  end
end
