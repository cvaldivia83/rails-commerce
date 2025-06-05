require 'securerandom'

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

  def create  
    @product = Product.new(product_params)
    @product.sku = SecureRandom.alphanumeric(10)
    if @product.save
      redirect_to user_path(current_user)
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    @product = Product.destroy
  end

  def set_product 
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price_cents, :stock_quantity, :photo)
  end
end
