puts 'Recreating World Feature Categories...'

WorldFeatureCategory.destroy_all

feature_categories = [ "建物", "乗り物", "服飾", "貨幣", "食べ物", "言語", "宗教", "外交", "政治", "歴史", "天候", "特産品", "民族", "文化", "技術", "その他" ]
feature_categories.each do |cat_name|
  WorldFeatureCategory.create!(name: cat_name)
end

puts '...World Feature Categories recreated!'
