crumb :stories do
  link "ホーム", stories_path
end

crumb :new_story do |story|
  link "ストーリー作成", new_story_path(story)
  parent :stories
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

crumb :flags do |story|
  link "フラグ一覧", story_flags_path(story)
  parent :story, story
end

crumb :new_flag do |story|
  link "フラグ作成", new_story_flag_path(story)
  parent :flags, story
end

crumb :flag do |story, flag|
  link truncate(flag.title, length: 15), story_flag_path(story, flag)
  parent :flags, story
end

crumb :edit_flag do |story, flag|
  link "フラグ編集", edit_story_flag_path(story, flag)
  parent :flag, story, flag
end

crumb :character_feature do |story, character_feature|
  link "特徴詳細: #{character_feature.character_feature_category.name}", story_character_feature_path(story, character_feature)
  parent :character, story, character_feature.character
end

crumb :edit_character_feature do |story, character_feature|
  link "特徴編集", edit_story_character_feature_path(story, character_feature)
  parent :character_feature, story, character_feature
end

crumb :world_guide_feature do |story, world_guide_feature|
  link "特徴詳細: #{world_guide_feature.world_feature_category.name}", story_world_guide_feature_path(story, world_guide_feature)
  parent :world_guide, story, world_guide_feature.world_guide
end

crumb :edit_world_guide_feature do |story, world_guide_feature|
  link "特徴編集", edit_story_world_guide_feature_path(story, world_guide_feature)
  parent :world_guide_feature, story, world_guide_feature
end

crumb :character_relationship do |story, character_relationship|
  link "関係性詳細: #{character_relationship.relationship_type}", story_character_relationship_path(story, character_relationship)
  parent :character, story, character_relationship.character
end

crumb :edit_character_relationship do |story, character_relationship|
  link "関係性編集", edit_story_character_relationship_path(story, character_relationship)
  parent :character_relationship, story, character_relationship
end
