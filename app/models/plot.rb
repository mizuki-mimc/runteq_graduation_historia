class Plot < ApplicationRecord
  belongs_to :story, touch: true
  has_many :plot_world_guides, dependent: :destroy
  has_many :world_guides, through: :plot_world_guides
  has_many :plot_characters, dependent: :destroy
  has_many :characters, through: :plot_characters

  validates :chapter, presence: true, length: { maximum: 10 }
  validates :title, length: { maximum: 30 }
  validates :summary, length: { maximum: 30 }
end
