require 'uri'

class UrlValidator
  def self.valid?(url)
    parsed_url = URI.parse(url)
    parsed_url.kind_of?(URI::HTTP) || parsed_url.kind_of?(URI::HTTPS)
  end
end
