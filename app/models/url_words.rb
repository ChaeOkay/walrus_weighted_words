require 'nokogiri'
require 'open-uri'

class UrlWords
  attr_reader :url
  private :url

  def initialize(url:)
    @url = url
  end

  def words_map
    # first value is a unique word, last value is an array of each word occurnce
    #   => ["cat", ["cat", "cat", "cat]]
    arrayed_words = parsed_site_words.group_by { |word| word }

    arrayed_words.inject({}) do |hash, (word, word_list) |
      hash[word] = word_list.size
      hash
    end
  end

  private

  def site
    Site.new(url: url)
  end

  def site_text
    site.content.inner_text.downcase.squish
  end

  def parsed_site_words
    site_text.scan(/([^\s]+\w)/).flatten
  end
end
