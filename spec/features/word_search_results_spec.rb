require 'rails_helper'

describe 'results' do
  context 'with valid new word search request' do
    VCR.use_cassette 'vtb_ice_palace' do
      let(:url) { 'https://en.wikipedia.org/wiki/VTB_Ice_Palace' }

      before do
        visit new_word_search_path
        fill_in 'word_search_url', with: url
        click_button I18n.t('word_search.new.submit_button')
      end

      it 'includes 10 search result items found on the given site' do
        table_rows_plus_header = page.find_all('table tr')
        expect(table_rows_plus_header.size).to eq 11
      end

      it 'displays the correct weighted words and frequency count' do
        first_result_entry = find_all('table tr[2] td')
        expect(first_result_entry.first.text).to eq 'arena'
        expect(first_result_entry.last.text).to eq '31'

        first_result_entry = find_all('table tr[3] td')
        expect(first_result_entry.first.text).to eq 'the'
        expect(first_result_entry.last.text).to eq '26'

        #last_result_entry = find_all('table tr[10] td')
        #expect(last_result_entry.first.text).to eq 'hockey'
        #expect(last_result_entry.last.text).to eq '11'

        #last_result_entry = find_all('table tr:last td')
        #expect(last_result_entry.first.text).to eq 'of'
        #expect(last_result_entry.last.text).to eq '10'
      end
    end
  end
end
