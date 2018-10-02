class Front::MembersController < ApplicationController
	# before_action :authentication_member!

	def index
	end

	def show
		@address = Address.find(params[:id])
		@member = Member.find(params[:id])
	end

	def create
	end

	def edit
		@member = Member.find(params[:id])
		@address = Address.find_by(member_id: @member.id)
	end

	def update
	    @address = Address.find(params[:id])
	    if @address.update(update_address_params)
	 	  redirect_to front_member_path(current_member.id)
	    else
		  render :action => "edit"
		end
	end

	def delete
	end

	def destroy
		@member = current_member
		@member.soft_delete
		redirect_to new_member_registration_path
	end

	def orderhistory
		@member = current_member
		@sales = @member.sales.order(updated_at: :desc)
		@shippings = @member.sale_shippings
		@shipping = @shippings.find_by(sale_id: @sale)
	end

	def shipping
    @member = current_member
    @shipping = SaleShipping.new
    @shippings = @member.sale_shippings
  end

  def generate
    member = current_member
    shipping = SaleShipping.new(shipping_params)
    shipping.save
    redirect_to shipping_front_member_path(member.id)
  end

   private

  def shipping_params
      params.require(:sale_shipping).permit(:organisation_name, :shipping_postal_code, :shipping_address1, :shipping_address2, :department, :contact_person, :user_telephone, :member_id)
  end
  def update_address_params
    params.require(:member).permit(:email, :_destroy, :id, addresses_attributes: [:corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic, :department, :phone, :postal_code, :prefecture_id, :address1, :address2])
  end

end
