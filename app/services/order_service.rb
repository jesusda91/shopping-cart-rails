class OrderService
  def initialize(
    session_id,
    repositories = {
      order: Order,
      product: Product
    }
  )
    @session_id = session_id
    @repositories = repositories
  end

  def create_order(cart)
    order = repositories[:order].new(session_id: session_id)
    product_quantities = cart.tally
    cart.try(:uniq).each do |product_id|
      order.order_items.build(product_id: product_id, quantity: product_quantities[product_id])
    end
    order.save
    order
  end

  def find_orders
    repositories[:order].where(session_id: session_id)
  end

  def delete_order(order_id)
    order = repositories[:order].find(order_id)
    order.destroy
  end

  def new_order(cart)
    order = repositories[:order].new
    product_ids_in_cart = cart
    cart_products = repositories[:product].where(id: product_ids_in_cart.try(:uniq))
    [order, product_ids_in_cart, cart_products]
  end

  attr_reader :session_id, :repositories
end