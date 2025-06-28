class ChangeCharacterColumnsToInteger < ActiveRecord::Migration[7.2]
  def change
    change_column :characters, :category, 'integer USING CAST(category AS integer)'
    change_column :characters, :gender, 'integer USING CAST(gender AS integer)'
  end
end
