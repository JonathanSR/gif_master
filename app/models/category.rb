class Category < ActiveRecord::Base
  has_many :gifs

  validates :title, presence: true
end