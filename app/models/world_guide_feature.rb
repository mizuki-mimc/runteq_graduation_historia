class WorldGuideFeature < ApplicationRecord
  belongs_to :world_guide
  belongs_to :world_feature_category

  validates :explanation, length: { maximum: 25 }
end
