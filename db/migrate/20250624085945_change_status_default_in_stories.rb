class ChangeStatusDefaultInStories < ActiveRecord::Migration[7.2]
  def change
    change_column_default :stories, :status, from: nil, to: 0
  end
end
