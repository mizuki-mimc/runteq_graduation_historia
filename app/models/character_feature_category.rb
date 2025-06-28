class CharacterFeatureCategory < ApplicationRecord
  has_many :character_features, dependent: :destroy
end
