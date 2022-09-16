class GroupMembershipsController < ApplicationController
  def create
   @membership = GroupMembership.new(parameters)
   @membership.user_id = current_user.id

   if @membership.save
    redirect_to groups_path(all: true)
   end
  end

  def destroy
    @membership = GroupMembership.find_by(user_id: params[:id], group_id: params[:group_id])
    @membership.destroy!
  end

  private

  def parameters
    params.permit(:id, :group_id)
  end
end