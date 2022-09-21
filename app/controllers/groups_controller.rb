class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]

  def index
    @groups = Group.includes(:posts).order(created_at: :desc)
  end

  def show
    @group = Group.includes(posts: [user: :avatar_attachment]).find(params[:id])
    authorize @group
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    authorize @group

    respond_to do |format|
      if @group.save
        create_group_membership
        format.turbo_stream { render turbo_stream: turbo_stream.prepend('groups', partial: 'groups/group', locals: {group: @group}) }
        format.html { redirect_to groups_path(all: true), notice: 'Group was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @group

    respond_to do |format|
      if @group.update(group_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@group, partial: 'groups/group', locals: {group: @group}) }
        format.html { redirect_to groups_path, notice: 'Group was successfully updated.' }
      end
    end
  end

  def destroy
    authorize @group

    @group.destroy
  end

  def member
    @groups = current_user.groups

    respond_to do |format|
      format.html { render template: 'groups/index' }
    end
  end

  def created_by_me
    @groups = current_user.groups.where(user_id: current_user.id)

    respond_to do |format|
      format.html { render template: 'groups/index' }
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:title)
  end

  def create_group_membership
    @membership = GroupMembership.new(group_id: @group.id, user_id: current_user.id, role: :admin)
    @membership.save!
  end
end
