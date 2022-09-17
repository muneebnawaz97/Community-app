class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    authorize @post
    
    if @post.save
      redirect_to group_path(params[:group_id])
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    
    authorize @post
    
    if @post.update(post_params)
      redirect_to group_path(params[:group_id])
    else
      format.html { redirect_to group_path(group_id: params[:group_id]), alert: "Failed to update post." }
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user

    authorize @post
    
  end

  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
      redirect_to group_path(params[:group_id])
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content, :group_id)
  end
end