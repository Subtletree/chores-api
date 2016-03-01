class AddIpRangeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ip_range, :string
  end
end
