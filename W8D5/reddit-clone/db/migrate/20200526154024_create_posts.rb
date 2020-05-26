class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :sub_id,null: false
      t.integer :author_id,null: false

      t.timestamps
    end
  end
end
