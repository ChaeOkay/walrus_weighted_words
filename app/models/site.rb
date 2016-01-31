class Site
  attr_reader :url
  private :url

  def initialize(url:)
    @url = url
  end

  def content
    Nokogiri::HTML(open url)
  end
end
