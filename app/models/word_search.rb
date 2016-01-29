class WordSearch < ActiveRecord::Base
  validates :url,
    presence: true
end
