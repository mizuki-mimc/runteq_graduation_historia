class ModifyFlagStatusColumns < ActiveRecord::Migration[7.2]
  def change
    add_column :plot_flags, :check_created, :boolean, default: false, null: false
    add_column :plot_flags, :check_recovered, :boolean, default: false, null: false

    remove_column :flags, :check_created, :boolean, if_exists: true
    remove_column :flags, :check_recovered, :boolean, if_exists: true
  end
end
