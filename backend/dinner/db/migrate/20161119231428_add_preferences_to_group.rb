class AddPreferencesToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :preferences, :JSON
  end
end
