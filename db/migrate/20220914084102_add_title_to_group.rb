class AddTitleToGroup < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :title, :string
  end
end
