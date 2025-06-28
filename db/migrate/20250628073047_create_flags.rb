class CreateFlags < ActiveRecord::Migration[7.2]
  def change
    create_table :flags do |t|
      t.references :story, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :check_created, default: false, null: false
      t.boolean :check_recovered, default: false, null: false

      t.timestamps
    end
  end
end
