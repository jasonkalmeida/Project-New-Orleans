class AddPreferencesToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :preferences, :JSON
  end
end
