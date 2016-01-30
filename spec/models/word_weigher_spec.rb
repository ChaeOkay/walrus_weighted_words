require 'spec_helper'

describe WordWeigher do
  let(:words) { %w(at bat sat cat rat mat tap pat lap gnat stat) }

  before do
    10.times { words << "stat" }
    9.times { words << "gnat" }
    8.times { words << "lap" }
    7.times { words << "pat" }
    6.times { words << "tap" }
    5.times { words << "mat" }
    4.times { words << "rat" }
    3.times { words << "cat" }
    2.times { words << "sat" }
    1.times { words << "bat" }
  end

  subject(:word_weigher) { described_class.new(words: words) }

  describe '#top_ten' do
    subject(:top_ten) { word_weigher.top_ten }
  end
end
