class CreateWorldFeatureCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :world_feature_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
