class ApplicationController < ActionController::Base
	# def after_sign_in_path_for(resource)
	# 	edit_front_member_path
	# end
	def after_sign_up_path_for(resource)
		edit_member_registration_path
	end
	def after_sign_out_path_for(resource)
		new_member_registration_path
	end

	private
	def sign_in_required
		redirect_to new_member_registration_url unless member_signed_in?
	end
	def sign_up_required
		redirect_to new_member_registration_url unless member_signed_up?
	end
end
