class AddHouseIDtoPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :house_id, :integer, null:false
  end
end
