class Plot < ApplicationRecord
  belongs_to :story, touch: true

  validates :chapter, presence: true, length: { maximum: 10 }
  validates :title, length: { maximum: 30 }
  validates :summary, length: { maximum: 30 }
end
