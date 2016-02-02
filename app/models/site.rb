class Site
  attr_reader :url
  private :url

  def initialize(url:)
    @url = url
  end

  def content
    sanitize
    html
  end

  private

  def sanitize
    html.xpath('//style').remove
    html.xpath('//script').remove
  end

  def html
  begin
    Nokogiri::HTML(open url)
  rescue => error
    puts error
    NullSite.new
  end
  end
end
