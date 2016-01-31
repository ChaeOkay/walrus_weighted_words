require 'spec_helper'

describe WeightedWord do
  context 'sorting a collection' do
    let(:weighted_word_1) { described_class.new(word: 'warlock',
                                                frequency: 5) }
    let(:weighted_word_2) { described_class.new(word: 'gargoyle',
                                                frequency: 10) }
    let(:weighted_word_3) { described_class.new(word: 'polyhedral',
                                                frequency: 20) }
    let(:collection) { [weighted_word_2,
                        weighted_word_3,
                        weighted_word_1 ] }
    subject { collection.sort }

    it { is_expected.to eq [weighted_word_3,
                            weighted_word_2,
                            weighted_word_1] }
  end
end
