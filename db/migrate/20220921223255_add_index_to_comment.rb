class AddIndexToComment < ActiveRecord::Migration[7.0]
    def change
      add_index :comments, :parent_id
    end
end
