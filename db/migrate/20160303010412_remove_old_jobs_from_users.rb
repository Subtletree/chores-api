class RemoveOldJobsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :last_jobs
  end
end
