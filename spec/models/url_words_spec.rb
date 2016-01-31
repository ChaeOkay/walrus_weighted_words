require 'spec_helper'

describe UrlWords do
  let(:url) { 'http://chaeokeefe.com' }
  before { VCR.insert_cassette 'chaeokeefe' }
  after { VCR.eject_cassette 'chaeokeefe' }
  subject(:url_words) { described_class.new(url: url) }

  describe '#all' do
    let(:expected_words) { ["Chae", "O'Keefe", "chaeokeefe@gmail.com", "About", "software", "developer", "2016", "Chae", "O'Keefe", "with", "help", "from", "Jekyll", "Bootstrap", "Twitter", "Bootstrap", "and", "Github", "Pages"] }

    it 'returns a collection of words viewable by a user' do
      expect(url_words.all.size).to eq expected_words.size
    end
  end
end
