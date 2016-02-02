require 'spec_helper'

describe WordSearch do
  let(:weighted_word_params) { { word: 'fox', frequency: 1 } }
  let(:url) { 'http://hi.com' }
  subject(:word_search) { described_class.new(url: url) }
  before { word_search.weighted_words.new(weighted_word_params) }

  context 'with valid url and no weighted words' do
    let(:weighted_word_params) { nil }
    it { is_expected.not_to be_valid }
  end

  describe 'valid_url?' do
    subject { word_search.valid_url? }

    context 'with valid url' do
      it { is_expected.to be true }
    end

    context 'with invliad url' do
      let(:url) { 'www.hi.com' }
      it 'is false' do
        expect(word_search.valid_url?).to be false
      end
    end
  end
end
