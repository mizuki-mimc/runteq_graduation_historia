class CharacterFeature < ApplicationRecord
  belongs_to :character, touch: true
  belongs_to :character_feature_category

  validates :explanation, length: { maximum: 25 }
end
