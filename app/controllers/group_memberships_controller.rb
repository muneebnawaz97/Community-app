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
    
    if @membership.destroy
      redirect_to group_path(params[:group_id])
    end
  end

  private

  def parameters
    params.permit(:id,:group_id,:role)
  end
end