class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
