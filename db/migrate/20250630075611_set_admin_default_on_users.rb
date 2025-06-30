class SetAdminDefaultOnUsers < ActiveRecord::Migration[7.2]
  def up
    User.where(admin: nil).update_all(admin: false)
    change_column :users, :admin, :boolean, default: false, null: false
  end

  def down
    change_column :users, :admin, :boolean, default: false, null: true
  end
end
