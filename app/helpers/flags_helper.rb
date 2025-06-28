module FlagsHelper
  def flag_status_indicator(flag)
    image_content = ""
    box_classes = "h-8 w-8 border-2 rounded-md flex items-center justify-center"

    if flag.recovered?
      box_classes += " border-green-500"
      image_content = image_tag("flag_recovered.png", class: "w-5 h-5")
    elsif flag.created?
      box_classes += " border-gray-300"
      image_content = image_tag("flag_placed.png", class: "w-5 h-5")
    else
      box_classes += " border-gray-300"
    end

    content_tag(:div, image_content, class: box_classes)
  end
end
