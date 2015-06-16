class AddSuccessToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :success, :integer
    add_column :workers, :cancel, :integer
    add_column :workers, :miss, :integer
  end
end
