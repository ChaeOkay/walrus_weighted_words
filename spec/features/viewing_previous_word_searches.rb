require 'rails_helper'

describe 'viewing previous word searches' do
  context 'with 2 past searches' do
    it 'includes 2 word search results' do
      visit word_searches_path
      table_rows_plus_header = page.find_all('table tr')
      expect(table_rows_plus_header.size).to eq 3
    end

    it 'displays the word search site' do
    end

    it 'displays the most frequency found word' do
    end

    it 'displays the frequency of the word used' do
    end
  end
end
