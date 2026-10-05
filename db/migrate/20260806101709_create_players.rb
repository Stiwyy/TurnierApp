class CreatePlayers < ActiveRecord::Migration[8.1]
  def change
    create_table :players do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.string :position
      t.integer :number

      t.timestamps
    end
  end
end
