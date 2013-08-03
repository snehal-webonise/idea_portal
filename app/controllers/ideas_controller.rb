class IdeasController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create]

  def index
    @ideas = Idea.paginate(:page => params[:page], :per_page => 2)
  end
  def new
     @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(params[:idea])
    if @idea.save
      flash[:notice] = "Successfully posted your idea"
      redirect_to idea_path(@idea)
    else
      render :action => "new"
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @like = Like.find_by_idea_id_and_user_id(params[:id],current_user.id)
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
    @like = Like.find_by_idea_id_and_user_id(params[:id], current_user.id)
    if params[:text] == "Like" && @like.blank?
     likes = Like.new(:idea_id => params[:id],:user_id => current_user.id)
     likes.save
    end

    respond_to do |format|
      format.js{render :nothing=>true}
    end
  end

  def delete_like
    @like = Like.find_by_idea_id_and_user_id(params[:id],current_user.id)
    if params[:text] == "Unlike" && @like.present?
     @like.destroy
    end

    respond_to do |format|
      format.js{render :nothing=>true}
    end
  end

end
