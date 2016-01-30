require 'spec_helper'

describe WordSearch do
  subject { described_class.new(url: url) }

  context 'with valid url' do
    let(:url) { 'http://hi.com' }
    it { is_expected.to be_valid }
  end

  context 'with invalid url' do
    let(:url) { 'www.hi.com' }
    it { is_expected.not_to be_valid }
  end
end
