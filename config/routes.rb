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
    resources :sale_items, only:[:index, :create, :show, :destroy]
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

  resources :carts, only:[:create, :update, :destroy] do
    member do
      delete :destroy_item
      delete :destroy_cart
      patch :update_edit
      patch :update_show
    end
  end

  resources :sale, except:[:new, :destroy] do
    member do
      # put :amount
      put :amount_show
      get :amount_show
      put :amount_edit
      get :amount_edit
      get :orderplaced
      patch :proceed_purchase
      put :proceed_purchase
      post :proceed_purchase
      patch :confirm_purchase
      put :confirm_purchase
      post :confirm_purchase
    end
    resources :sale_shippings do
      member do
        get :proceed_purchase
        patch :proceed_purchase
        put :proceed_purchase
      end
    end
    resource :pay_selects, only:[:create, :show] do
      member do
        get :proceed_purchase
        patch :proceed_purchase
        put :proceed_purchase
      end
    end
    resources :sale_items, only:[:index, :create, :show]
  end

  resources :credit_cards
  resources :sale_invoices

end

