class AddLastJobsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_jobs, :text, array: true, default: []
  end
end
