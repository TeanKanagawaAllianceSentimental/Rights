Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :applicants do
    member do
      get :application1
    end
  end
  resources :applications, only:[:new, :create, :show] do
    member do
      get :selectmusic
      get :review
      get :submitted
    end
  end
    resources :list_of_performed_pieces, only:[:new, :create, :show]
end
