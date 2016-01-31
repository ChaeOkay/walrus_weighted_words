require 'spec_helper'

describe UrlWords do
  subject(:url_words) { described_class.new(url: url) }

  describe '#all' do
    let(:url) { 'http://chaeokeefe.com' }
    let(:expected_words) { ["Chae", "O'Keefe", "chaeokeefe@gmail.com", "About", "software", "developer", "2016", "Chae", "O'Keefe", "with", "help", "from", "Jekyll", "Bootstrap", "Twitter", "Bootstrap", "and", "Github", "Pages"] }
    let(:site) { instance_double('Site') }
    let(:site_content) { Nokogiri::HTML.open("#{Rails.root}/spec/fixtures/chaeokeefe.html") }

    before do
      allow(site).to receive(:content) { site_content }
    end

    it 'returns a collection of words viewable by a user' do
      expect(url_words.all.size).to eq expected_words.size
    end
  end
end
