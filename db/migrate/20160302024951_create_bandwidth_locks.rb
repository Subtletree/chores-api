class CreateBandwidthLocks < ActiveRecord::Migration[5.0]
  def change
    create_table :bandwidth_locks do |t|
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
