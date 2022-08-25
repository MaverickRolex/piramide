class AddProviderBalanceToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :provider_balance, :integer
  end
end
