class Character < ApplicationRecord
  belongs_to :story, touch: true

  belongs_to :birthplace_world_guide, class_name: "WorldGuide", optional: true
  belongs_to :address_world_guide, class_name: "WorldGuide", optional: true
  
  enum category: {
    present: "現在",
    future: "未来",
    past: "過去",
    fantasy: "空想"
  }
end
