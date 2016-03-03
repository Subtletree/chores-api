class AddFortnightlyToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :fortnightly, :boolean, default: false
  end
end
