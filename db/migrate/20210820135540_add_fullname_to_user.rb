class AddFullnameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :string, :string
  end
end
