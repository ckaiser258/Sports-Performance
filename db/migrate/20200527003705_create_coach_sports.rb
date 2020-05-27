class CreateCoachSports < ActiveRecord::Migration[6.0]
  def change
    create_table :coach_sports do |t|
      t.belongs_to :coach, null: false, foreign_key: true
      t.belongs_to :sport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
