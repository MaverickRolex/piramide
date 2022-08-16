class CreateSaleProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_products do |t|
      t.integer :sale_id
      t.integer :product_id
      t.integer :quantity
      t.integer :total_price
      t.timestamps
    end
  end
end
