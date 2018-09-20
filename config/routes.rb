Rails.application.routes.draw do

  get 'items/index'
  get 'items/show'
  root 'top#index'
  namespace :admin, path: 'admin' do
  	resources :items
    resources :disk
    resources :rights, controller: 'genres'
    resources :musics
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
