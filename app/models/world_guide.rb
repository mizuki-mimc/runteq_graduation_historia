class WorldGuide < ApplicationRecord
  belongs_to :story, touch: true
  has_many :world_guide_features, dependent: :destroy
  has_many :world_feature_categories, through: :world_guide_features
  has_many :plot_world_guides, dependent: :destroy
  has_many :plots, through: :plot_world_guides
  accepts_nested_attributes_for :world_guide_features, allow_destroy: true, reject_if: :all_blank

  enum category: {
    present: "現在",
    future: "未来",
    past: "過去",
    fantasy: "空想"
  }

  def country_and_region
    [country_name, region_name].compact.reject(&:blank?).join(' / ')
  end

  validates :world_name, length: { maximum: 20 }
  validates :country_name, presence: true, length: { maximum: 20 }
  validates :region_name, presence: true, length: { maximum: 20 }
end
