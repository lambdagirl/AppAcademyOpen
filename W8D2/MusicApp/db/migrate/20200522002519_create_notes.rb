class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :challenge_id, null: false
      t.integer :user_id, null: false
      t.text :content, null: false

      t.timestamps
    end
    add_index :notes, :challenge_id
    add_index :notes, :user_id
  end
end
