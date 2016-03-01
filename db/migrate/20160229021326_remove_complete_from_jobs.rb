class RemoveCompleteFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :complete
  end
end
