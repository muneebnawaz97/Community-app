class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]

  def index
    @groups = Group.all
  end

  def show
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    
    respond_to do |format|
      if @group.save
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('groups', partial: 'groups/group', locals: {group: @group}) }
        format.html { redirect_to groups_path, notice: "Group was successfully created." }
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@group, partial: "groups/group", locals: {group: @group}) }
        format.html { redirect_to groups_path, notice: "Group was successfully updated." }
      end
    end
  end

  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
    end
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:title)
    end
end
