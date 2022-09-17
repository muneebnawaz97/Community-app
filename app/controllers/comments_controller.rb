class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  def index
    @groups = Comment.all
  end

  def show
  end

  def new
    @group = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to group_post_path(group_id: params[:group_id], id: params[:post_id]), notice: "Comment was successfully created." }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to group_post_path(group_id: params[:group_id], id: params[:post_id]), notice: "Comment was successfully created." }
      end
    end
  end

  def destroy
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to group_post_path(id: params[:post_id], group_id: params[:group_id]), notice: "Comment was successfully destroyed." }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params[:comment][:post_id] = params[:post_id]
      params[:comment][:parent_id] = params[:comment_id]
      params.require(:comment).permit(:post_id,:content,:parent_id)
    end
end
