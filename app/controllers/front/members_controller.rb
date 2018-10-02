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
    @sales = Sale.find(params[:id])
    # @sale = @sales.find(params[:member_id])
    # @sale_items = @sale.sale_items
	end

	def creditcards
		@member = current_member
		@credits = @member.credit_cards
	end

	def invoices
		@member = current_member
		@invoices = @member,invoices
	end

	def shippings
		@member = current_member
		@shippings = @member.shippings
	end

	def applicactionhistory
		@member = current_member
		@application = @member.application
	end

	def applicants
		@member = current_member
		@applicants = @member.applicants
	end
	private
def update_address_params
    params.require(:member).permit(:email, :_destroy, :id, addresses_attributes: [:corporate_name, :corporate_phonetic, :contact_person_name, :contact_person_phonetic, :department, :phone, :postal_code, :prefecture_id, :address1, :address2])
  end
end
