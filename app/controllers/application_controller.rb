class ApplicationController < ActionController::Base
  private

  def cart
    session[:cart] ||= []
  end

  def cart_service
    @cart_service ||= CartService.new(session)
  end
end
