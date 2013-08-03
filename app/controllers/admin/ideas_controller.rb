class Admin::IdeasController < ApplicationController
	layout "admin"

	def index
		@ideas = Idea.all
	end

	def show
		@idea = Idea.find(params[:id])
		@comments = @idea.comments
		@total_likes = Like.total_likes(@idea).count
	end

end
