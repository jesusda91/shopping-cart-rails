class OrdersController < ApplicationController
  helper ProductsHelper

  before_action :find_order, only: %i[show destroy]

  def new
    @order, @product_ids_in_cart, @cart_products = order_service.new_order(cart)
  end

  def create
    order = order_service.create_order(cart)
    if order
      cart_service.empty_cart
      return redirect_to order, notice: 'La orden fue creada exitosamente.'
    end

    render :new
  end

  def show; end

  def index
    @orders = order_service.find_orders
  end

  def destroy
    order_service.delete_order(params[:id])
    redirect_to orders_path, notice: 'Orden fue eliminada exitosamente.'
  end

  private

  def order_service
    @order_service ||= OrderService.new(session[:session_id])
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
