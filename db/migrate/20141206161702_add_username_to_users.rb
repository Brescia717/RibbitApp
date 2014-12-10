class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index  :users, :username, unique: true
    add_column :users, :avatar_url, :string  # I decided to add the avatar_url column as well.
  end
end
