class CreateWorldGuides < ActiveRecord::Migration[7.2]
  def change
    create_table :world_guides do |t|
      t.string :category
      t.string :world_name
      t.string :country_name
      t.string :region_name
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
