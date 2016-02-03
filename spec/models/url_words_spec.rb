require 'spec_helper'

describe UrlWords do
  subject(:url_words) { described_class.new(url: url) }

  describe '#words_map' do
    VCR.use_cassette 'chaeokeefe', allow_playback_repeats: true do
      let(:url) { 'http://chaeokeefe.com' }
      subject(:words_map) { url_words.words_map }

      it 'returns a map of unique words' do
        expect(words_map.size).to eq 16
      end

      it 'returns a hash' do
        expect(words_map).to be_a Hash
      end

      it 'returns the word as the key' do
        expect(words_map.first[0]).to be_a String
      end

      it 'returns the frequency as the value' do
        expect(words_map.first[1]).to be_an Integer
      end
    end
  end
end
