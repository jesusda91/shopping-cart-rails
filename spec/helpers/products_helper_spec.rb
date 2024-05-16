require 'rails_helper'

RSpec.describe ProductsHelper, type: :helper do
  let(:product1) { create(:product) }
  let(:product2) { create(:product) }

  describe '#product_in_cart?' do
    context 'when cart is empty' do
      it 'returns 0' do
        expect(helper.product_in_cart?([], product1)).to eq(false)
      end
    end

    context 'when product is in cart' do
      it 'returns true' do
        expect(helper.product_in_cart?([product1.id, product2.id], product1)).to eq(true)
      end
    end

    context 'when product is not in cart' do
      it 'returns false' do
        expect(helper.product_in_cart?([product2.id], product1)).to eq(false)
      end
    end
  end

  describe '#qty_product_in_cart' do
    context 'when cart is empty' do
      it 'returns 0' do
        expect(helper.qty_product_in_cart([], product1)).to eq(0)
      end
    end

    context 'when cart has multiple occurrences of product' do
      it 'returns the number of occurrences' do
        expect(helper.qty_product_in_cart([product1.id, product1.id, product2.id], product1)).to eq(2)
      end
    end

    context 'when cart has single occurrence of product' do
      it 'returns 1' do
        expect(helper.qty_product_in_cart([product1.id, product2.id], product1)).to eq(1)
      end
    end
  end
end
