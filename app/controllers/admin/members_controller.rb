class Admin::MembersController < Admin::AdminBase
# before_action :authenticate_admin!

	def after_sign_out_path_for(resource)
    	new_admin_session_path
  	end
	def index
		@members = Address.search(params[:search])
	end
	def show
		@address = Address.find(params[:id])
		@member = Member.find(params[:id])
	end
	def edit
		@member = Member.find(params[:id])
		@address = Address.find(params[:id])
	end
	def update
		@address = Address.find(params[:id])
	    if @address.update(update_address_params)
	 	  redirect_to admin_member_path
	    else
		  render :edit
		end
	end
	def destroy
		@member = Member.find(params[:id])
		@member.soft_delete
		redirect_to admin_members_path
	end
end
