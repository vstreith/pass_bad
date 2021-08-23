class AddAddressToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :address, :string
  end
end
