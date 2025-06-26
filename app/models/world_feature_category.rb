class WorldFeatureCategory < ApplicationRecord
  has_many :world_guide_features, dependent: :destroy
  has_many :world_guides, through: :world_guide_features
end
