require 'uri'

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless valid_url?(value)
      record.errors[attribute]
        .push(options[:message] || I18n.t('word_search.errors.url'))
    end
  end

  def valid_url?(url)
    url = URI.parse(url)
    url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
  end
end
