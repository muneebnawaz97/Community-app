class GroupTypesController < ApplicationController

  def index
    @groups = current_user.groups

    respond_to do |format|
      format.html { render template: 'groups/index' }
    end
  end

  def show
    @groups = current_user.groups.where(user_id: current_user.id)

    respond_to do |format|
      format.html { render template: 'groups/index' }
    end
  end
end
