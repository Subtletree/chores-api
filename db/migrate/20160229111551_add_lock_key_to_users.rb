class AddLockKeyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lock_key, :string
  end
end
