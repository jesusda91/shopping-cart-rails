module OrdersHelper
  def order_total(products, product_ids_in_cart)
    product_quantities = product_ids_in_cart.tally
    products.sum do |product|
      product.price * (product_quantities[product.id] || 0)
    end
  end
end
