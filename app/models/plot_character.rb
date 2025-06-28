class PlotCharacter < ApplicationRecord
  belongs_to :plot
  belongs_to :character

  validates :character_id, uniqueness: { scope: :plot_id }
end
