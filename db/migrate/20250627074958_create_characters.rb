class CreateCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :gender
      t.string :age
      t.string :category
      t.references :story, null: false, foreign_key: true

      t.references :birthplace_world_guide, foreign_key: { to_table: :world_guides }
      t.references :address_world_guide, foreign_key: { to_table: :world_guides }

      t.timestamps
    end
  end
end
