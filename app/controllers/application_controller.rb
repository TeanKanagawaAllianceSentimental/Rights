class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    added_attrs = [addresses_attributes: [:corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic,:department, :phone, :postal_code, :address1, :address2, :email, :password, :password_confirmation]]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
