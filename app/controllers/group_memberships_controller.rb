class GroupMembershipsController < ApplicationController
  def create
   @membership = GroupMembership.new(parameters)
   @membership.user_id = current_user.id

   if @membership.save
    redirect_to groups_path(all: true)
   end
  end

  private

  def parameters
    params.permit(:group_id)
  end
end