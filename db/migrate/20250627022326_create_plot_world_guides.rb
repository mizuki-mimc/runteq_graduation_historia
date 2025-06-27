class CreatePlotWorldGuides < ActiveRecord::Migration[7.2]
  def change
    create_table :plot_world_guides do |t|
      t.references :plot, null: false, foreign_key: true
      t.references :world_guide, null: false, foreign_key: true

      t.timestamps
    end
  end
end
