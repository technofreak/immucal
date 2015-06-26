class RemoveChildIdFromChildren < ActiveRecord::Migration
  def up
    remove_column :children, :child_id
  end

  def down
    add_column :children, :child_id, :integer
  end
end
