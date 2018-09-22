# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  def after_sign_up_path_for(resource)
    edit_member_registration_path
  end

  # GET /resource/sign_up
  def new
     @member = Member.new
     @member.addresses.build
  end

  # POST /resource
  def create
     super
     member = Member.new(member_params)
     member.id = current_member.id
     member.save
  end

  # GET /resource/edit
  def edit
    # @member = Address.find(params[:id])
  end

  # PUT /resource
  def update
    # member = Address.find(params[:id])
    # member.update(address_params)
    # redirect_to front_members_path
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
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
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
     params.require(:member).permit(addresses_attributes: [:id, :prefecture_id, :corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic, :phone])
  end

  def update_member_params
     params.require(:member).permit(addresses_attributes: [:id, :prefecture_id, :corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic, :phone, :id, :_destroy])
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update, keys:[:corporate_name])
  end
end
