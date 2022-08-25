class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :sale_id
      t.integer :amount
      t.timestamps
    end
  end
end
