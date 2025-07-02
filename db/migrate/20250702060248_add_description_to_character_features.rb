class AddDescriptionToCharacterFeatures < ActiveRecord::Migration[7.2]
  def change
    add_column :character_features, :description, :text
  end
end
