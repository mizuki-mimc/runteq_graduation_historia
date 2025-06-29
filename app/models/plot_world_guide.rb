class PlotWorldGuide < ApplicationRecord
  belongs_to :plot, touch: true
  belongs_to :world_guide
end
