class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.references :votable, polymorphic:true, index:true

      t.timestamps
    end
  end
end
