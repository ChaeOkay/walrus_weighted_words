require 'spec_helper'

describe WordSearch do
  subject { described_class.new(url: url) }

  context 'with valid url' do
    let(:url) { 'http://hi.com' }
    it { is_expected.to be_valid }
  end

  context 'with invalid url' do
    let(:url) { 'www.hi.com' }
    it { is_expected.not_to be_valid }
  end

  describe '#top_ten_weighted_words' do
    context 'with weighted words' do
      let(:weighted_words) { %w(a b c d e f g h i j l m).shuffle }
      let(:word_search) { described_class.new(url: 'https://chaeokeefe.com') }

      before do
        allow_any_instance_of(UrlWords).to receive(:all) { ['words'] }
        allow_any_instance_of(WordWeigher).to receive(:words)
        allow_any_instance_of(WordWeigher).to receive(:weighted_words) { weighted_words }
      end

      it 'returns the top 10 sorted words' do
        expect(word_search.top_ten_weighted_words)
          .to eq weighted_words.sort[0..9]
      end
    end
  end
end
