class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to group_path(params[:group_id])
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content, :group_id)
  end
end