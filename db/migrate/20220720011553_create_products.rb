class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string    :code, null: false
      t.string    :name, null: false
      t.text      :description, null: true
      t.text      :ingredients, null: true
      t.integer   :price, null: true
      t.integer   :stock, null: true
      t.timestamps
    end
  end
end
