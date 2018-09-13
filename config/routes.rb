Rails.application.routes.draw do

  get 'items/index'
  get 'items/show'
  root 'top#index'
  namespace :admin do
  	resources :items, except:[:show]
    resources :disk, only:[:new, :create, :edit, :update, :destroy]
    resources :genres, only:[:index, :new, :create, :edit, :update, :destroy]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
