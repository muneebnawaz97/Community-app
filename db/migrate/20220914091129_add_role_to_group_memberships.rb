class AddRoleToGroupMemberships < ActiveRecord::Migration[7.0]
  def change
    add_column :group_memberships, :role, :integer, null: :false
  end
end
