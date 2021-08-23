class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :club_name
      t.text :summary
      t.integer :court_number
      t.integer :place_number
      t.boolean :training_monday
      t.boolean :training_tuesday
      t.boolean :training_wednesday
      t.boolean :training_thusday
      t.boolean :training_friday
      t.boolean :training_saturday
      t.boolean :training_sunday
      t.boolean :player_ranking_n
      t.boolean :player_ranking_r
      t.boolean :player_ranking_d
      t.boolean :player_ranking_pnc
      t.boolean :is_coach
      t.boolean :active
      t.boolean :ffbad_affiliated
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
