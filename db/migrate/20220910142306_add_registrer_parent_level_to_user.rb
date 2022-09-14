class AddRegistrerParentLevelToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :registrer_id, :integer
    add_column :users, :parent_id, :integer
    add_column :users, :level, :integer
  end
end
