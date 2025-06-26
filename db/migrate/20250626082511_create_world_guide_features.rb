class CreateWorldGuideFeatures < ActiveRecord::Migration[7.2]
  def change
    create_table :world_guide_features do |t|
      t.string :explanation
      t.references :world_guide, null: false, foreign_key: true
      t.references :world_feature_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
