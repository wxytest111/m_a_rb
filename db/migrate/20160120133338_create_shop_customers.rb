class CreateShopCustomers < ActiveRecord::Migration
  def change
    create_table :shop_customers do |t|
      t.integer :state
      t.references :shop, index: true
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :shop_customers, :shops
    add_foreign_key :shop_customers, :customers
  end
end
