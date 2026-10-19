class RenamePlayerNameColumns < ActiveRecord::Migration[8.1]
  def change
    rename_column :players, :name, :first_name
    rename_column :players, :surname, :last_name
  end
end
