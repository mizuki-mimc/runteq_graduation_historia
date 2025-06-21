if defined?(TailwindCss)
  Rails.application.config.tailwindcss.input = Rails.root.join("app", "assets", "tailwind", "application.css")
end
