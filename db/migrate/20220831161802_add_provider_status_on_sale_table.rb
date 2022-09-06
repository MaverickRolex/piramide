class AddProviderStatusOnSaleTable < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :provider_status, :boolean, default: false
  end
end
