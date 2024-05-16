class CartService
  def initialize(session)
    @session = session
  end

  def add_to_cart(product_id)
    session[:cart] ||= []
    session[:cart] << product_id
  end

  def remove_from_cart(product_id)
    session[:cart]&.delete(product_id)
  end

  def empty_cart
    session[:cart] = []
  end

  attr_reader :session
end
