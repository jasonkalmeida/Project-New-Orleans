class AddEmailsToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :emails, :JSON
  end
end
