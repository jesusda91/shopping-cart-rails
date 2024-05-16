class ProductsController < ApplicationController
  before_action :set_product, only: %i[add_to_cart remove_from_cart]
  before_action :set_all_products, only: [:index]

  def index
    @cart_products_ids = cart
  end

  def add_to_cart
    cart << @product.id
    redirect_to products_path, notice: "#{@product.name} fue añadido al carrito."
  end

  def remove_from_cart
    cart.delete(@product.id)
    redirect_to products_path, alert: "#{@product.name} fue eliminado del carrito."
  end

  private

  def cart
    session[:cart] ||= []
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_all_products
    @products = Product.all
  end
end
