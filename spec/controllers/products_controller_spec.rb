require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  before { session[:cart] = [] }
  let(:product) { create(:product) }
  let(:cart) { session[:cart] ||= [] }

  describe 'GET #index' do
    let!(:products) { create_list(:product, 3) }

    it 'returns a successful response and assigns all products to @products' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(assigns(:products)).to eq(products)
    end

    it 'assigns cart product IDs to @cart_products_ids' do
      get :index
      expect(assigns(:cart_products_ids)).to eq(session[:cart])
    end
  end

  describe 'POST #add_to_cart' do
    it 'redirects to index after adding product to cart' do
      post :add_to_cart, params: { id: product.id }
      expect(response).to redirect_to(products_path)
    end

    it 'adds product ID to session cart' do
      expect { post :add_to_cart, params: { id: product.id } }.to change { session[:cart] }.from([]).to([product.id])
    end

    it 'sets a flash notice with product name' do
      post :add_to_cart, params: { id: product.id }
      expect(flash[:notice]).to eq("#{product.name} fue añadido al carrito.")
    end

    context 'with invalid product ID' do
      it 'redirects to index with error' do
        expect { post :add_to_cart, params: { id: 0 } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'DELETE #remove_from_cart' do
    before { cart << product.id }

    it 'redirects to index after removing product from cart' do
      delete :remove_from_cart, params: { id: product.id }
      expect(response).to redirect_to(products_path)
    end

    it 'removes product ID from session cart' do
      expect { delete :remove_from_cart, params: { id: product.id } }.to change {
                                                                           session[:cart]
                                                                         }.from([product.id]).to([])
    end

    it 'sets a flash alert with product name' do
      delete :remove_from_cart, params: { id: product.id }
      expect(flash[:alert]).to eq("#{product.name} fue eliminado del carrito.")
    end

    context 'with invalid product ID' do
      it 'redirects to index with error' do
        expect { delete :remove_from_cart, params: { id: 0 } }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
