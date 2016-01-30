require 'rails_helper'

describe 'user word search' do
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
end
