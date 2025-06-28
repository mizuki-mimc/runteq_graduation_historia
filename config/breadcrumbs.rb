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

crumb :edit_plot do |story, plot|
  link "プロット編集", edit_story_plot_path(story, plot)
  parent :story, story
end

crumb :world_guides do |story|
  link "ワールドガイド一覧", story_world_guides_path(story)
  parent :story, story
end

crumb :new_world_guide do |story|
  link "ワールドガイド作成", new_story_world_guide_path(story)
  parent :world_guides, story
end

crumb :world_guide do |story, world_guide|
  link world_guide.region_name, story_world_guide_path(story, world_guide)
  parent :world_guides, story
end

crumb :edit_world_guide do |story, world_guide|
  link "ワールドガイド編集", edit_story_world_guide_path(story, world_guide)
  parent :world_guide, story, world_guide
end

crumb :characters do |story|
  link "キャラクター一覧", story_characters_path(story)
  parent :story, story
end

crumb :new_character do |story|
  link "キャラクター作成", new_story_character_path(story)
  parent :characters, story
end

crumb :character do |story, character|
  link character.name, story_character_path(story, character)
  parent :characters, story
end

crumb :edit_character do |story, character|
  link "キャラクター編集", edit_story_character_path(story, character)
  parent :character, story, character
end
