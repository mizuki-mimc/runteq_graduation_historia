class CreatePlots < ActiveRecord::Migration[7.2]
  def change
    create_table :plots do |t|
      t.string :chapter
      t.string :title
      t.string :summary
      t.text :content
      t.integer :order
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
