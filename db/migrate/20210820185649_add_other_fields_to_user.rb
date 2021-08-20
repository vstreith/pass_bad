class AddOtherFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :licence_number, :string
    add_column :users, :club, :text
  end
end
