class Product < ApplicationRecord
  has_one_attached :photo
  has_many :order_items
  has_many :orders, through: :order_items
end
