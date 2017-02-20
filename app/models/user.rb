class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :favorites
  has_many :gifs, through: :favorites

  enum role: [:default, :admin]
end