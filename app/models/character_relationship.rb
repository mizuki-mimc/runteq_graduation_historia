class CharacterRelationship < ApplicationRecord
  belongs_to :character, class_name: "Character", inverse_of: :relationships, touch: true
  belongs_to :related_character, class_name: "Character", inverse_of: :reverse_of_relationships

  validates :relationship_type, length: { maximum: 25 }
end
