Rails.application.routes.draw do

  resource :cart, only: :show do
    post 'add_product/:product_id', action: :add_product, as: 'add_product'
    delete 'remove_product/:product_id', action: :remove_product, as: 'remove_product'
    delete 'empty_cart', action: :empty_cart, as: 'empty_cart'
  end

  devise_for :users
  resources :products
  get "up" => "rails/health#show", as: :rails_health_check

  root "products#index"
end
