class CreateStories < ActiveRecord::Migration[7.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :genre
      t.text :thema
      t.text :synopsis
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
