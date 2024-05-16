Rails.application.routes.draw do
  resources :products, only: [:index] do
    post 'add_to_cart', on: :member
    delete 'remove_from_cart', on: :member
  end

  resources :orders, only: %i[new create show index destroy]

  root 'products#index'
end
