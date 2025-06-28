class CharacterRelationship < ApplicationRecord
  belongs_to :character, class_name: "Character", inverse_of: :relationships
  belongs_to :related_character, class_name: "Character", inverse_of: :reverse_of_relationships
end
