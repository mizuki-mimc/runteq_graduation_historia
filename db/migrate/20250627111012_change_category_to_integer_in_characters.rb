class ChangeCategoryToIntegerInCharacters < ActiveRecord::Migration[7.2]
  def change
    change_column :characters, :category, :integer, using: 'category::integer'
  end
end
