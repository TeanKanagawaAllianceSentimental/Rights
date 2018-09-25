Rails.application.routes.draw do

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
  resources :members, only:[:index, :edit]
  end


  namespace :admin, path: 'admin' do
  	resources :items
    resources :disk
    resources :rights, controller: 'genres'
    resources :musics
  end

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

  resources :carts, only:[:create, :update, :destroy]
  resources :sale, except:[:new, :destroy] do
    member do
      get :orderplaced
      patch :continue_purchase
      put :continue_purchase
      post :continue_purchase
      patch :confirm_purchase
      put :confirm_purchase
      post :confirm_purchase
    end
  end
  resources :sale_items, only:[:create]
  resources :sale_shipping, except:[:new]
  resources :pay_selects, only:[:create, :show]
  resources :credit_cards
  resources :sele_invoices

  namespace :front do
  resources :members, only:[:index, :edit]
  end

end

