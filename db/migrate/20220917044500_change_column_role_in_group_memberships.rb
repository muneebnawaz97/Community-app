class ChangeColumnRoleInGroupMemberships < ActiveRecord::Migration[7.0]
  def change
    change_column_null :group_memberships, :role, false 
  end
end
