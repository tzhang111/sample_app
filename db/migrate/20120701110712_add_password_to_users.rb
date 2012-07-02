class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_password, :string

  end
  remove_column :users, :encrypted_password
end
