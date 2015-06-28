class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.references :customer, index: true
      t.integer :price
      t.datetime :end_time
      t.references :product, index: true
      t.integer :status, null:false, default: 0
      t.references :order, index: true
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :coupons, :customers
    add_foreign_key :coupons, :products
    add_foreign_key :coupons, :orders
  end
end
