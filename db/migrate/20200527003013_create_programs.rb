class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.text :description
      t.string :price
      t.belongs_to :coach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
