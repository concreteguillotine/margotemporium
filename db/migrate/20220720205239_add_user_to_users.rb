class AddUserToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user, :boolean, default: true
  end
end
