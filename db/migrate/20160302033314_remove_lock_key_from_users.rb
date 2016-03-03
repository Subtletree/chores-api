class RemoveLockKeyFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lock_key
  end
end
