class AddLNameToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :LName, :string
  end
end
