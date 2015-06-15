class AddPasswordToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :password, :string
  end
end
