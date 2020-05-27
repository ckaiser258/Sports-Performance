class CreateAthleteSports < ActiveRecord::Migration[6.0]
  def change
    create_table :athlete_sports do |t|
      t.belongs_to :athlete, null: false, foreign_key: true
      t.belongs_to :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
