class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :email, format: {:with => /@/}
  validates :password, length: {in: 6..30}
  has_many :orders
  has_many :carted_products
end