class CreateCharacterFeatures < ActiveRecord::Migration[7.2]
  def change
    create_table :character_features do |t|
      t.string :explanation
      t.references :character, null: false, foreign_key: true
      t.references :character_feature_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
