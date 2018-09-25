Rails.application.routes.draw do

  get 'sale/show' => 'sale#show'

  get 'items/index'
  get 'items/show'
  root 'top#index'

  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        registrations: 'admins/registrations'
      }

  devise_for :members, controllers: {
      sessions: 'members/sessions',
      registrations: 'members/registrations',
      passwords: 'members/passwords'
  }

  namespace :front do
  resources :members, only:[:index, :show, :edit]
  end

  namespace :admin, path: 'admin' do
    resources :members, only:[:index, :show]
  	resources :items
    resources :disk
    resources :rights, controller: 'genres'
    resources :musics
  end


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

  resources :cart, only:[:create, :update, :destroy]
  resources :sales, except:[:new, :destroy]
  resources :sale_items, only:[:create]
  resources :shipping_address, except:[:new]
  resources :pay_selects, only:[:create, :show]

end

