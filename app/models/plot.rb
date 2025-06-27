class Plot < ApplicationRecord
  belongs_to :story, touch: true
  has_many :plot_world_guides, dependent: :destroy
  has_many :world_guides, through: :plot_world_guides

  validates :chapter, presence: true, length: { maximum: 10 }
  validates :title, length: { maximum: 30 }
  validates :summary, length: { maximum: 30 }
end
