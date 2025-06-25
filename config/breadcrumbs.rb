crumb :stories do
  link "ホーム", stories_path
end

crumb :story do |story|
  link truncate(story.title, length: 10), story_path(story)
  parent :stories
end
