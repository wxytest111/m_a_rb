class AddAddressToWorker < ActiveRecord::Migration
  def change
    add_column :workers, :address, :string
  end
end
