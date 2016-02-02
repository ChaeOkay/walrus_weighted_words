FactoryGirl.define do
  factory :word_search, class: WordSearch do |word_search|
    word_search.sequence(:url) { |n| "http://123123word#{n}.com" }
    after :build do |word_search|
      word_search.weighted_words << FactoryGirl.build(:weighted_word, word_search: word_search)
    end
  end
end
