require 'rails_helper'

RSpec.describe 'products/index.html.erb', type: :view do
  let(:product) { create(:product, name: 'Producto 1', price: 10.0) }

  context 'when cart is empty' do
    it 'displays all the products' do
      assign(:products, [product])
      assign(:cart_products_ids, [])
      render
      expect(rendered).to match(/Producto 1/)
      expect(rendered).to match(/10.00/)
      expect(rendered).to match(/Añadir/)
      expect(rendered).not_to match(/Eliminar productos/)
    end
  end

  context 'when cart has products' do
    it 'displays all the products and "Eliminar"' do
      assign(:products, [product])
      assign(:cart_products_ids, [product.id])
      render
      expect(rendered).to match(/Producto 1/)
      expect(rendered).to match(/10.00/)
      expect(rendered).to match(/Eliminar productos/)
    end
  end
end
