class Plot < ApplicationRecord
  belongs_to :story, touch: true

  validates :chapter, presence: true
end
