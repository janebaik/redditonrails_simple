class ChangeSubs < ActiveRecord::Migration[5.2]
  def change
    change_column_null :posts, :url, true
    change_column_null :posts, :content, true
  end
end
