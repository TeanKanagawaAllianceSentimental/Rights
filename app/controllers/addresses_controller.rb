class AddressesController < ApplicationController

  def create
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(update_address_params)
 	  redirect_to front_member_path(current_member.id)
    else
	  @member = Member.find(@address.member.id)
	  render "front/members/edit"
	end
  end

  def destroy
  end

  def update_address_params
    params.require(:address).permit(:corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic, :department, :phone, :postal_code, :prefecture_id, :address1, :address2)
  end
end
