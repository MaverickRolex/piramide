class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :user_id
      t.integer :total_amount
      t.integer :total_balance
      t.timestamps
    end
  end
end
