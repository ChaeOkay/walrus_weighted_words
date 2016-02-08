require 'nokogiri'
require 'open-uri'

class Site
  attr_reader :url
  private :url

  def initialize(url:)
    @url = url
  end

  def site_text
    @site_text ||= sanitized_html.inner_text.downcase.squish
  end

  private

  def sanitized_html
    html.tap { |html| html.xpath('//style|//script').remove }
  end

  def html
  @html ||=
  begin
    Nokogiri::HTML(open url)
  rescue => error
    puts error
    NullSite.new
  end
  end
end
