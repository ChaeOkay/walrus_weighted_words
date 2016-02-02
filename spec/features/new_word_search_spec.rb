require 'rails_helper'

describe 'new word search' do
  describe 'with valid url' do
    VCR.use_cassette 'vtb_ice_palace' do
      let(:url) { 'https://en.wikipedia.org/wiki/VTB_Ice_Palace' }

      it 'displays the given url when provided and persisted' do
        visit new_word_search_path
        fill_in 'word_search_url', with: url
        click_button I18n.t('word_search.new.submit_button')
        expect(page).to have_content(I18n.t('word_search.show.site_searched', site: url))
      end
    end
  end

  it 'dsiplays a validation error when invalid' do
    visit new_word_search_path
    fill_in 'word_search_url', with: 'www.hi.com'
    click_button I18n.t('word_search.new.submit_button')
    expect(page).to have_content(I18n.t('word_search.errors.url'))
  end

  it 'displays a rails presence validation message when missing' do
    visit new_word_search_path
    click_button I18n.t('word_search.new.submit_button')
    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
