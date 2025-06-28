class CreateCharacterRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :character_relationships do |t|
      t.string :relationship_type
      t.references :character, null: false, foreign_key: true
      t.references :related_character, null: false, foreign_key: { to_table: :characters }

      t.timestamps
    end
  end
end
