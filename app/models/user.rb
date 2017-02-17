class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  enum role: [:default, :admin]
end