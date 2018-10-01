      # frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
     @member = Member.new
     @member.addresses.build
  end

  # POST /resource
  # def create
  #    super
  #    member = Member.new(member_params)
  #    member.id = current_member.id
  #    member.save
  # end
  def create
    build_resource(member_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        redirect_to new_member_registration_path
        # respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end


  # GET /resource/edit
  def edit

  end

  # PUT /resource
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to front_members_path
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [addresses_attributes:[]])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
  def member_params
     params.require(:member).permit(:email, :password, :password_confirmation, :agreement, addresses_attributes: [:id, :prefecture_id, :corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic, :department, :phone, :postal_code, :address1, :address2])
  end

  def account_update_params
     devise_parameter_sanitizer.sanitize(:account_update, addresses_attributes: [:corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic,:department, :phone, :postal_code, :address1, :address2, :email, :password, :password_confirmation])
  end
  # def update_member_params
  #    params.require(:member).permit(addresses_attributes: [:id, :prefecture_id, :corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic, :phone, :id, :_destroy])
  # end

end
