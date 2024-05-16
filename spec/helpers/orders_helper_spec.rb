require 'rails_helper'

RSpec.describe OrdersHelper, type: :helper do
  let(:product1) { create(:product, price: 10) }
  let(:product2) { create(:product, price: 15) }
  let(:product3) { create(:product, price: 20) }

  describe '#order_total' do
    let(:products) { [product1, product2, product3] }

    context 'when product_ids_in_cart is empty' do
      it 'returns 0' do
        expect(helper.order_total(products, [])).to eq(0)
      end
    end

    context 'when product_ids_in_cart has products' do
      let(:product_ids_in_cart) { [product1.id, product1.id, product2.id, product3.id] }

      it 'calculates the total price correctly' do
        expected_total = (10.0 * 2) + 15.0 + 20.0
        expect(helper.order_total(products, product_ids_in_cart)).to eq(expected_total)
      end
    end
  end
end
