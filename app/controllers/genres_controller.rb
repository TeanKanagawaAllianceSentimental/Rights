class GenresController < ApplicationController
	def index
		@genres = Genre.search(params[:search])
	end


end

