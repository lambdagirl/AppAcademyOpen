class AddStartDatetoChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :start_date, :datetime, default: -> {'NOW()'}, null: false
  end
end
