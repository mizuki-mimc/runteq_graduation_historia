class ChangeGenderTypeInCharacters < ActiveRecord::Migration[7.2]
  def change
    change_column :characters, :gender, :integer, using: 'gender::integer'
  end
end
