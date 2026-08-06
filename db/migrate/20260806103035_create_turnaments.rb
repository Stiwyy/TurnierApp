class CreateTurnaments < ActiveRecord::Migration[8.1]
  def change
    create_table :turnaments do |t|
      t.string :name
      t.timestamp :start_time

      t.timestamps
    end
  end
end
