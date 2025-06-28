class CharacterFeature < ApplicationRecord
  belongs_to :character
  belongs_to :character_feature_category
end
