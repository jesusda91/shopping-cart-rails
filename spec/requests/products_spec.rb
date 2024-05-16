require 'rails_helper'

RSpec.describe ProductsController, type: :request do
  let(:product) { create(:product) }

  describe 'GET #index' do
    let!(:products) { create_list(:product, 3) }

    context 'when there are products' do
      it 'returns a successful response and response includes all products' do
        products
        get products_path
        expect(response).to be_successful
        expect(response).to render_template(:index)
        expect(response.body).to include(products.first.name)
        expect(response.body).to include(products.second.name)
        expect(response.body).to include(products.third.name)
      end
    end
  end

  describe 'POST #add_to_cart' do
    context 'when adding a product to the cart' do
      it 'adds the product to the cart and redirects to index' do
        post add_to_cart_product_path(product)
        expect(session[:cart]).to include(product.id)
        expect(response).to redirect_to(products_path)
        expect(flash[:notice]).to eq("#{product.name} fue añadido al carrito.")
      end
    end
  end

  describe 'DELETE #remove_from_cart' do
    context 'when removing a product from the cart' do
      it 'removes the product from the cart and redirects to products path with an alert' do
        post add_to_cart_product_path(product)
        delete remove_from_cart_product_path(product)
        expect(session[:cart]).not_to include(product.id)
        follow_redirect!
        expect(response.body).to include("#{product.name} fue eliminado del carrito.")
      end
    end
  end
end
