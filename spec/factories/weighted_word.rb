FactoryGirl.define do
  factory :weighted_word do
    word_search
    sequence(:word) { |n| "word#{n}" }
    sequence(:frequency) { |n| n }
  end
end
