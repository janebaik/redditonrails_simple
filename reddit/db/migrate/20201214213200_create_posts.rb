class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :content, null: false
      t.integer :sub_id, null: false, unique: true, index: true

      t.timestamps
    end
  end
end