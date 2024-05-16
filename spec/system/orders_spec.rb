require 'rails_helper'

RSpec.describe 'Orders', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'creates a new order' do
    product = create(:product, name: 'Product 1', price: 10.0)
    product2 = create(:product, name: 'Product 2', price: 15.0)
    visit products_path

    click_on 'Añadir al Carrito', match: :first
    expect(page).to have_content "#{product.name} fue añadido al carrito."
    expect(find('.shopping-cart .badge').text).to eq('1')

    find(:xpath, "(//button[contains(text(),'Añadir al Carrito')])[2]").click
    expect(page).to have_content "#{product2.name} fue añadido al carrito."
    expect(find('.shopping-cart .badge').text).to eq('2')

    click_on('Carrito', class: 'shopping-cart')
    expect(page).to have_content 'Carrito de Compras'
    expect(page).to have_content product.name
    expect(page).to have_content product.price
    expect(page).to have_content product2.name
    expect(page).to have_content product2.price
    expect(page).to have_content product.price + product2.price

    click_on('Guardar Orden', id: 'save-order-btn')

    expect(page).to have_content 'Detalles de la Orden'
    expect(page).to have_content 'Datos de la Orden'
    order = Order.last
    expect(page).to have_content order.id
  end
end
