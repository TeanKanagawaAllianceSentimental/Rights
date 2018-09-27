class GenresController < ApplicationController
	def index
		@genres = Genre.search(params[:search])
		@search_count = @genres.count
	end


end

