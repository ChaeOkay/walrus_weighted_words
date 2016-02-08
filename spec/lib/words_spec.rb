require 'words'
require 'spec_helper'

describe Words do
  describe '.extract' do
    it 'does not include numbers' do
      site_text = "1401 cat O'Keefe go-oal"
      extracted_words = described_class.extract(site_text)
      expected_result = %w(cat O'Keefe go-oal)
      expect(extracted_words).to eq expected_result
    end
  end

  describe '.frequency' do
    it 'returns a count of word occurrance' do
      site_text = "cat cat dog dog dog"
      frequency = described_class.frequency(site_text)
      expect(frequency["cat"]).to eq 2
      expect(frequency["dog"]).to eq 3
    end
  end
end
