class Front::MembersController < ApplicationController
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
		@address.update(address_params)
		redirect_to front_member_path(resource)
	end
end
