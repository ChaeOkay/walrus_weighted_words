require 'rails_helper'

describe 'user word search' do
  let(:site) { 'http://chaeokeefe.com' }

  describe 'requires a url' do
    it 'displays the given url when provided and persisted' do
      visit new_word_search_path
      fill_in 'word_search_url', with: site
      click_button I18n.t('word_search.new.submit_button')
      page.has_content?(I18n.t('word_search.show.site_searched', site: site))
    end
  end
end
