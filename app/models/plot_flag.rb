class PlotFlag < ApplicationRecord
  belongs_to :plot, touch: true
  belongs_to :flag

  validates :flag_id, uniqueness: { scope: :plot_id }
end
