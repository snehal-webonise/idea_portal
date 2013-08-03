class IdeasController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

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
    @comments = @idea.comments
    @comment = @idea.comments.new
  end

  def create_comment
    @idea = Idea.find(params[:id])
    @new_comment = @idea.comments.new(params[:comment])
    if @new_comment.save
      flash[:notice] = "Posted comment successfully."
    end
    @comments = @idea.comments
    respond_to do |format|
      format.js
    end
  end

  def increase_likes
    if params[:text] == "Like"
     likes = Like.new(:idea_id => params[:id],:user_id => current_user.id)
     likes.save
    else
      Like.where(:idea_id=>params[:id],:user_id=>current_user.id).delete_all
    end

     respond_to do |format|
       format.js{render :nothing=>true}
     end
  end

end
