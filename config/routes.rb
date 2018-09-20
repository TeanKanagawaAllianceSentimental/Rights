Rails.application.routes.draw do


  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        registrations: 'admins/registrations'
      }
  devise_for :members, controllers: {
  		sessions: 'members/sessions',
  		registrations: 'members/registrations',
  		passwords: 'members/passwords'
  }
<<<<<<< HEAD
  namespace :front do
  resources :members, only:[:index, :edit]
  end
=======

  get 'items/index'
  get 'items/show'
  root 'top#index'
  namespace :admin do
  	resources :items, except:[:show]
    resources :disk, only:[:new, :create, :edit, :update, :destroy]
    resources :genres, only:[:index, :new, :create, :edit, :update, :destroy]
    resources :sale_items, only:[:index,:show] do
      member do
        get :orderhistory
      end
    end
  end
  

>>>>>>> f729b241544b1856af008eb79c4ba6674a7f7356
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :applicants do
    member do
      get :application1
    end
  end

  resources :applications, only:[:new, :create, :show, :index] do
    member do
      get :selectmusic
      get :review
      get :submitted
    end
  end
    resources :list_of_performed_pieces, only:[:new, :create, :show]

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
