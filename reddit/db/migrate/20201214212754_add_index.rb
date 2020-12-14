class AddIndex < ActiveRecord::Migration[5.2]
  def change
    add_index :subs, :post_id
  end
end
