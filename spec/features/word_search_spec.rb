require 'rails_helper'


describe 'new word search' do
  let(:url) { 'https://en.wikipedia.org/wiki/VTB_Ice_Palace' }
  let(:site) { instance_double('Site') }
  let(:site_content) { Nokogiri::HTML.open("#{Rails.root}/spec/fixtures/vtb_source.html") }

  before do
    allow(site).to receive(:content) { site_content }
  end

  describe 'requires a url' do
    it 'displays the given url when provided and persisted' do
      visit new_word_search_path
      fill_in 'word_search_url', with: url
      click_button I18n.t('word_search.new.submit_button')
      expect(page).to have_content(I18n.t('word_search.show.site_searched', site: url))
    end

    it 'displays a rails presence validation message when missing' do
      visit new_word_search_path
      click_button I18n.t('word_search.new.submit_button')
      expect(page).to have_content(I18n.t('errors.messages.blank'))
    end

    it 'dsiplays a validation error when invalid' do
      visit new_word_search_path
      fill_in 'word_search_url', with: 'www.hi.com'
      click_button I18n.t('word_search.new.submit_button')
      expect(page).to have_content(I18n.t('word_search.errors.url'))
    end
  end

  describe 'results' do
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

      last_result_entry = find_all('table tr[10] td')
      expect(last_result_entry.first.text).to eq 'hockey'
      expect(last_result_entry.last.text).to eq '10'

      last_result_entry = find_all('table tr:last td')
      #expect(last_result_entry.first.text).to eq 'of'
      #expect(last_result_entry.last.text).to eq '10'
      expect(last_result_entry.first.text).to eq 'is'
      expect(last_result_entry.last.text).to eq '8'
    end
  end
end
