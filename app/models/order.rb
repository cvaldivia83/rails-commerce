class Order < ApplicationRecord

  enum status: { pending: 0, confirmed: 1, shipped: 2, cancelled: 3}
  belongs_to :user
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items 
end
