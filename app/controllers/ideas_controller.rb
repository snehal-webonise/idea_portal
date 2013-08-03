class IdeasController < ApplicationController
  def index
    logger.info("###############{Idea.find(:all).inspect}##########")
    @ideas = Idea.paginate(:page => params[:page], :per_page => 2)
  end
  def new
     @idea = Idea.new
  end

  def create
    @idea = Idea.new(params[:idea])
    if @idea.save
      flash[:notice] = "Successfully posted your idea"
      redirect_to idea_path(@idea)
    else
      render :action => "new"
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

end
