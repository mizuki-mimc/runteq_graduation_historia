class CreatePlotCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :plot_characters do |t|
      t.references :plot, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
    add_index :plot_characters, [ :plot_id, :character_id ], unique: true
  end
end
