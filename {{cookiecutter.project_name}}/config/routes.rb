Rails.application.routes.draw do
  scope "/admin" do
    resources :users
    resources :roles
  end
  devise_for :users
  root to: 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
