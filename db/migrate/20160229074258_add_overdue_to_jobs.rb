class AddOverdueToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :overdue, :boolean, default: false
  end
end
