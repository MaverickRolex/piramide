class AddSoldToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :sold, :integer
  end
end
