class Admin::MembersController < Admin::AdminBase

	def after_sign_out_path_for(resource)
    new_admin_session_path
  	end
	def index
		@member = Address.all
	end
	def show
		@member = Address.find(params[:id])
	end
end
