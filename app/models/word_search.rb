class WordSearch < ActiveRecord::Base
  validates :url,
    presence: true,
    url: true

  def words
    UrlWords.new(url: url).all
  end
end
