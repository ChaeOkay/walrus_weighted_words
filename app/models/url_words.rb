require 'nokogiri'
require 'open-uri'

class UrlWords
  attr_reader :url
  private :url

  def initialize(url:)
    @url = url
  end

  def all
    parsed_site_words
  end

  private

  def site
    @site ||= Nokogiri::HTML(open url)
  end

  def site_text
    site.inner_text.squish
  end

  def parsed_site_words
    site_text.scan(/([^\s]+\w)/).flatten
  end
end
