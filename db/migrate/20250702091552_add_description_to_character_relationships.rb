class AddDescriptionToCharacterRelationships < ActiveRecord::Migration[7.2]
  def change
    add_column :character_relationships, :description, :text
  end
end
