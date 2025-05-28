class Order < ApplicationRecord

  enum status: { pending: 0, confirmed: 1, shipped: 2, cancelled: 3}
  
end
