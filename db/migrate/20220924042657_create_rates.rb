class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.string :guest
      t.string :payment
      t.string :by_level
      t.string :weekly
      t.string :biweekly
      t.string :monthly
      t.string :rank
      t.timestamps
    end
  end
end
