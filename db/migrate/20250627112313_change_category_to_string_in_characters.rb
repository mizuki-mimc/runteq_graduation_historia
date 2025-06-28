class ChangeCategoryToStringInCharacters < ActiveRecord::Migration[7.2]
  def change
    change_column :characters, :category, :string
  end
end
