class AddPeriodToProduct < ActiveRecord::Migration
  def change
    add_column :products, :period, :text
  end
end
