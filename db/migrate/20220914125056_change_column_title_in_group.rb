class ChangeColumnTitleInGroup < ActiveRecord::Migration[7.0]
  def change
    change_column_null :groups, :title, false
  end
end
