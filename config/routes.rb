Rails.application.routes.draw do


  get 'items/index'
  get 'items/show'
  root 'top#index'
  get 'front/delete' => 'front/members#delete'

  devise_for :admins, controllers: {
        sessions: 'admins/sessions',
        registrations: 'admins/registrations',
        passwords: 'admins/passwords'
      }

  devise_for :members, controllers: {
      sessions: 'members/sessions',
      registrations: 'members/registrations',
      passwords: 'members/passwords'
  }

  namespace :front do
  resources :members
  end

  namespace :admin, path: 'admin' do
    resources :members
  	resources :items
    resources :disk
    resources :rights, controller: 'genres'
    resources :musics
    resources :sale_items
  end


  resources :search, controller: 'genres', only:[:index]
  resources :items

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
    resources :sale_shippings, except:[:new] do
      get :proceed_purchase
      patch :proceed_purchase
      put :proceed_purchase
    end
    resource :pay_selects, only:[:create, :show] do
      get :proceed_purchase
      patch :proceed_purchase
      put :proceed_purchase
    end
  end

  resources :sale_items, only:[:index, :create]
  resources :sale_shipping, except:[:new]
  resources :pay_selects, only:[:create, :show]
  resources :credit_cards
  resources :sale_invoices

end

