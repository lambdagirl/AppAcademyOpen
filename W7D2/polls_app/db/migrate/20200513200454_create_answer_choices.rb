class CreateAnswerChoices < ActiveRecord::Migration[6.0]
  def change
    create_table :answer_choices do |t|
      t.string :text
      t.references :question, null: false, foreign_key: true
    end
  end
end
