class ChangePost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :author_id, :Integer
  end
end
