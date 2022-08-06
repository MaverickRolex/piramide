class AddStatusToSale < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :status, :integer, default: 0
  end
end
