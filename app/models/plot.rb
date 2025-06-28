class Plot < ApplicationRecord
  belongs_to :story, touch: true
  has_many :plot_world_guides, dependent: :destroy
  has_many :world_guides, through: :plot_world_guides
  has_many :plot_characters, dependent: :destroy
  has_many :characters, through: :plot_characters
  has_many :plot_flags, dependent: :destroy
  has_many :flags, through: :plot_flags

  accepts_nested_attributes_for :plot_flags, allow_destroy: true

  validates :chapter, presence: true, length: { maximum: 10 }
  validates :title, length: { maximum: 30 }
  validates :summary, length: { maximum: 30 }
end
