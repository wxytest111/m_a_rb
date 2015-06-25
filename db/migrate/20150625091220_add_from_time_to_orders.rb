class AddFromTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :from_time, :datetime
    add_column :orders, :end_time, :datetime
  end
end
