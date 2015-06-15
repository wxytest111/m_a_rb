class AddPicToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :pic, :string
  end
end
