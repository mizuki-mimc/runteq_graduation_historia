class AddDescriptionToWorldGuideFeatures < ActiveRecord::Migration[7.2]
  def change
    add_column :world_guide_features, :description, :text
  end
end
