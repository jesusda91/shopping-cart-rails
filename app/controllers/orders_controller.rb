class OrdersController < ApplicationController
  helper ProductsHelper

  before_action :find_order, only: %i[show destroy]

  def new
    @order = Order.new
    @product_ids_in_cart = cart
    @cart_products = Product.where(id: @product_ids_in_cart.try(:uniq))
  end

  def create
    @order = Order.new(session_id: session[:session_id])
    product_quantities = cart.tally
    cart.try(:uniq).each do |product_id|
      @order.order_items.build(product_id: product_id, quantity: product_quantities[product_id])
    end

    if @order.save
      session[:cart] = []
      return redirect_to @order, notice: 'Orden fue creada exitosamente.'
    end

    render :new
  end

  def show; end

  def index
    @orders = Order.where(session_id: session[:session_id])
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: 'Orden fue eliminada exitosamente.'
  end

  private

  def cart
    session[:cart] ||= []
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
