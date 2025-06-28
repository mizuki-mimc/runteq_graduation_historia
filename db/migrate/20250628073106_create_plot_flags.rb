class CreatePlotFlags < ActiveRecord::Migration[7.2]
  def change
    create_table :plot_flags do |t|
      t.references :plot, null: false, foreign_key: true
      t.references :flag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :plot_flags, [ :plot_id, :flag_id ], unique: true
  end
end
