require 'rails_helper'


describe 'new word search' do
  let(:site) { 'http://chaeokeefe.com' }
  describe 'requires a url' do
    it 'displays the given url when provided and persisted' do
      visit new_word_search_path
      fill_in 'word_search_url', with: site
      click_button I18n.t('word_search.new.submit_button')
      expect(page).to have_content(I18n.t('word_search.show.site_searched', site: site))
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
    # probably wants to be moved to show page once created without before block
    before do
      visit new_word_search_path
      fill_in 'word_search_url', with: site
      click_button I18n.t('word_search.new.submit_button')
    end

    it 'includes 10 search result items found on the given site' do
      table_rows_plus_header = page.find_all('table tr')
      expect(table_rows_plus_header.size).to eq 11
    end

    it 'includes 2 attributes of a result entry, word and frequency' do
      result_entry = find_all('table tr:last td')
      expect(result_entry.size).to eq 2
    end
  end
end
