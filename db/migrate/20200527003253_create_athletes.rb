class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.string :name
      t.string :age
      t.string :email
      t.belongs_to :coach, foreign_key: true
      t.belongs_to :program, foreign_key: true

      t.timestamps
    end
  end
end
