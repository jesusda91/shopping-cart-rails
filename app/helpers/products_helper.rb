module ProductsHelper
  def product_in_cart?(cart, product)
    return false if cart.blank?

    cart.include?(product.id)
  end

  def qty_product_in_cart(cart, product)
    cart.count(product.id)
  end
end
