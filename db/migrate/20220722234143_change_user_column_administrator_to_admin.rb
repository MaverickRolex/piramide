class ChangeUserColumnAdministratorToAdmin < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :administrator, :admin
  end
end
