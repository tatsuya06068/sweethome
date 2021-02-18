class AddAdminFlgToAdmin < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :admin_flg, :boolean
  end
end
