class WorldGuide < ApplicationRecord
  belongs_to :story, touch: true

  enum category: {
    present: "現在",
    future: "未来",
    past: "過去",
    fantasy: "空想"
  }
end
