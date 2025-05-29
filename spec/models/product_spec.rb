require 'rails_helper'

RSpec.describe Product, type: :model do 
  describe "validates a good product" do 
    it "should have a price in cents" do 
      product = Product.new(price_cents: 10000)
      product.save

      expect(product).to_be
    end
  end

  
end