require 'uri'

class UrlValidator < ActiveModel::Validator
  def validate(record)
    unless valid_url?(record.url)
      record.errors[:invalid_url] << I18n.t('word_search.errors.url')
    end
  end

  def valid_url?(url)
    parsed_url = URI.parse(url)
    parsed_url.kind_of?(URI::HTTP) || parsed_url.kind_of?(URI::HTTPS)
  end
end
