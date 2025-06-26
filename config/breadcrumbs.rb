crumb :stories do
  link "ホーム", stories_path
end

crumb :story do |story|
  link truncate(story.title, length: 10), story_path(story)
  parent :stories
end

crumb :edit_story do |story|
  link "ストーリー編集", edit_story_path(story)
  parent :story, story
end

crumb :new_plot do |story|
  link "プロット作成", new_story_plot_path(story)
  parent :story, story
end
