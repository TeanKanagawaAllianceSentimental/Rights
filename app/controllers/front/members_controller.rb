class Front::MembersController < ApplicationController
	def index
	end
	def show
	end
	def edit
	end
	def create
	end
	def update
		@member = Member.find(current_member.id)
		@member.update(member_params)
		redirect_to front_members
	end
end
