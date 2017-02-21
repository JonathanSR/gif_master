class Gif < ActiveRecord::Base
validates :image_path, presence: true

  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorite
end