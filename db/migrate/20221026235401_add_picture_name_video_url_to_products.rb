class AddPictureNameVideoUrlToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :picture_name, :string
    add_column :products, :video_url, :string
  end
end
