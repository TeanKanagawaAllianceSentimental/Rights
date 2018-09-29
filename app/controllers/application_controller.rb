class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    front_member_path(resource)
  end
  def after_sign_in_path_for(resource)
  	case resource
	  when Member
	    front_members_path(resource)
	  when Admin
	  	admin_members_path(resource)
	  end
  end

  def after_sign_out_path_for(resource)
    new_member_session_path
  end


  def configure_permitted_parameters
    added_attrs = [addresses_attributes: [:corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic,:department, :phone, :postal_code, :prefecture_id, :address1, :address2, :email, :password, :password_confirmation]]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
  def update_address_params
    params.require(:address).permit(:corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic,:department, :phone, :postal_code, :prefecture_id, :address1, :address2, members_attributes: [:email, :_destroy, :id])
  end
end
