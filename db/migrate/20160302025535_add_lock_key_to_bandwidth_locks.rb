class AddLockKeyToBandwidthLocks < ActiveRecord::Migration[5.0]
  def change
    add_column :bandwidth_locks, :lock_key, :string
  end
end
