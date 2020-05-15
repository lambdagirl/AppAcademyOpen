class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.references :poll, null: false, foreign_key: true
    end
  end
end
