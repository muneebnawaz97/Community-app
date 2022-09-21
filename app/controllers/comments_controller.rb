class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to group_post_path(group_id: params[:group_id], id: params[:post_id]), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to group_post_path(group_id: params[:group_id], id: params[:post_id]), alert: 'Failed to create comment.' }
      end
    end
  end

  def update
    authorize @comment
    @comment.update(comment_params)
  end

  def destroy
    authorize @comment

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to group_post_path(id: params[:post_id], group_id: params[:group_id]), notice: 'Comment was successfully destroyed.' }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    set_params
    params.require(:comment).permit(:post_id, :content, :parent_id)
  end

  def set_params
    params[:comment][:post_id] = params[:post_id]
    if params[:comment_id]
      params[:comment][:parent_id] = params[:comment_id]
    end
  end
end
