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
		@address = Address.find(params[:id])
	end
	def update
	    @address = Address.find(params[:id])
	    if @address.update(update_address_params)
	 	  redirect_to front_member_path(current_member.id)
	    else
		  render :edit
		end
	end
	def delete

	end
	def destroy
		@member = current_member.id
		@member.soft_delete
		redirect_to new_member_registration_path
	end
end
