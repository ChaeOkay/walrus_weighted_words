require 'spec_helper'

describe WeightedWord do
  let(:word_search) { FactoryGirl.create(:word_search) }
  let!(:weighted_words) { FactoryGirl.create_list(:weighted_word, 12, word_search: word_search) }

  specify '.sorted_by_frequency' do
    first_in_list = described_class.sorted_by_frequency.first
    expect(first_in_list.frequency).to eq weighted_words.last.frequency
  end

  specify '.top_ten' do
    tenth_sorted = described_class.sorted_by_frequency[9]
    last_in_top_ten = described_class.top_ten.last
    expect(last_in_top_ten).to eq tenth_sorted
  end

  specify '.heaviest' do
    expect(described_class.heaviest)
      .to eq described_class.sorted_by_frequency.first
  end
end
