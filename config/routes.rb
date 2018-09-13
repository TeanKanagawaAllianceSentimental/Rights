Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/cart" => "sale#cart"
  get "/buy/selectaddress" => "sale#selectaddress"
  get "/buy/selectpay" => "sale#selectpay"
  get "/buy/review" => "sale#review"
  get "/orderplaced" => "sale#orderplaced"

  get "/applicant" => "applicants#applicant"
  get "/application" => "applications#application"
  get "/selectmusic" => "applications#selectmusic"
  get "/listofperformedpieces" => "list_of_performed_pieces#listofperformedpieces"
  get "/application/review" => "applications#review"
  get "/submitted" => "applications#submitted"
end
