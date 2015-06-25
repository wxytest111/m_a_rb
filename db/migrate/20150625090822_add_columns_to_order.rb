class AddColumnsToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :customer, index: true
    add_foreign_key :orders, :customers
    add_reference :orders, :worker, index: true
    add_foreign_key :orders, :workers
    add_reference :orders, :product, index: true
    add_foreign_key :orders, :products
  end
end
