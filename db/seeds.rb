puts 'Recreating World Feature Categories...'

WorldFeatureCategory.destroy_all

feature_categories = [ "建物", "乗り物", "服飾", "貨幣", "食べ物", "言語", "宗教", "外交", "政治", "歴史", "天候", "特産品", "民族", "文化", "技術", "その他" ]
feature_categories.each do |cat_name|
  WorldFeatureCategory.create!(name: cat_name)
end

puts '...World Feature Categories recreated!'

puts 'Creating Character Feature Categories...'

CharacterFeatureCategory.destroy_all

character_feature_categories = [ "性格", "身長", "体重", "髪型", "髪色", "目の色", "肌の色", "武器", "思想", "宗教", "能力", "特技", "服装", "言語", "癖", "その他" ]
character_feature_categories.each do |cat_name|
  CharacterFeatureCategory.create!(name: cat_name)
end

puts '...Character Feature Categories created!'
