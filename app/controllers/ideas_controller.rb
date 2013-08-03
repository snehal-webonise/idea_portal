class IdeasController < ApplicationController
  def index

  end

  def show
    @idea = Idea.find(params[:id])
  end

end
