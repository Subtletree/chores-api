class AddDefaultToTasksComplete < ActiveRecord::Migration[5.0]
  def change
    change_column_default :tasks, :complete, false
  end
end
