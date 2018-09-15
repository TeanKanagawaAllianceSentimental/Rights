Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sales, only:[:edit, :update, :create] do
    member do
      get :cart
      get :selectaddress
      get :selectpay
      get :review
      get :orderplaced
    end
  end
end
