require 'rails_helper'

describe 'new word search' do
  it 'requires a url' do
    visit new_word_search_path
    fill_in 'word_search_url', with: 'http://chaeokeefe.com'
  end
end
