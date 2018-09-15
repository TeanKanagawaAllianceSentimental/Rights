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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
