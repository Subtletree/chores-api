class AddCompleteToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :complete, :boolean
  end
end
