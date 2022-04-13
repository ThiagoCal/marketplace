require "json"
require "byebug"

class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :import]

  def index
    @products = policy_scope(Product)
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

  def create
    authorize @product
    @product = Product.new(product_params)
    @user = User.find(params[:user_id])
    if @product.save
      redirect_to products_path
    end
  end

  def edit
    authorize @product
    @product = Product.find(params[:id])
  end

  def update
    authorize @product
    @product = Product.find(params[:id])
    @product.update(product_params)
    if @product.save
      redirect_to product_path
    end
  end

  def destroy
    authorize @product
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def import
    @file = params[:file].tempfile.read

    products = JSON.parse(@file)
    products.each do |product|
      puts product
      @product = Product.new(name: product["title"], description: product["description"], price: product["price"], photo: product["filename"])
      @product.user = current_user
      authorize @product
      @product.save
    end
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:user_id, :name, :photo, :description, :price, :category, :available)
    end
end
