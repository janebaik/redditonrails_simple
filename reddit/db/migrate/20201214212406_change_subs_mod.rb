class ChangeSubsMod < ActiveRecord::Migration[5.2]
  def change
    rename_column :subs, :moderator, :moderator_id
    add_column :subs, :post_id, :Integer
  end
end
