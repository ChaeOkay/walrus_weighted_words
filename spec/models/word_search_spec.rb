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

  context 'with weighted words' do
    let(:word_search) { described_class.new(url: 'https://chaeokeefe.com') }

    before do
      allow_any_instance_of(UrlWords).to receive(:all) { ['words'] }
      allow_any_instance_of(WordWeigher).to receive(:words)
      allow_any_instance_of(WordWeigher).to receive(:weighted_words) { weighted_words }
    end

    context 'with more than 10 weighted words' do
      let(:weighted_words) { %w(a b c d e f g h i j l m) }
      describe '#top_ten_weighted_words' do

        subject { word_search.top_ten_weighted_words.size }
        it { is_expected.to eq 10 }
      end
    end


      end
    end
  end
end
