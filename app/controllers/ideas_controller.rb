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
      logger.info "-------------#{@idea.errors.inspect}"
      render :action => "new"
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update_attributes(params[:idea])
    flash[:notice] = "Your Idea edited successfully"
    redirect_to idea_path(@idea)
  end

  def delete_idea
    Idea.find(params[:id]).delete
    flash[:notice] = "Your Idea deleted successfully"
    redirect_to ideas_path
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


  def show_ideas
    if params[:my_ideas].present?
      @ideas = current_user.ideas.paginate(:page => params[:page], :per_page => 2)
    else
      @ideas = Idea.paginate(:page => params[:page], :per_page => 2)
    end

  end

  def categoriwise_idea
    category_id = Category.find_by_name(params[:type])
    @ideas = Idea.where(:category_id => category_id.id ).paginate(:page => params[:page], :per_page => 2)
    logger.info"##########{@ideas.inspect}"
  end

end
