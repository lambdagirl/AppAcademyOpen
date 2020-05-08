class AddAddressToHouses < ActiveRecord::Migration[6.0]
  def change
    add_column :houses, :address, :text, null:false
  end
end
