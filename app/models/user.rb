class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  has_many :favorites
  has_many :articles, through: :favorites
end
