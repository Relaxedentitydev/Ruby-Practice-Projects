Rails.application.routes.draw do
  resources :channels
  resources :discussions do 
    resources :replies
  end
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root 'discussions#index'
end
