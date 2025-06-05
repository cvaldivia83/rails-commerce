class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_product, only: [:show, :destroy]
  def index 
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def destroy 
    @product = Product.destroy
  end

  def set_product 
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price_cents, :stock_quantity, :sku)
  end
end
