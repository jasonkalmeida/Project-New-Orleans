class AddFNameToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :FName, :string
  end
end
