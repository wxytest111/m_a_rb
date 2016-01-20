class CreatePayRecords < ActiveRecord::Migration
  def change
    create_table :pay_records do |t|
      t.references :customer, index: true
      t.references :product, index: true
      t.references :shop, index: true
      t.integer :pay_state
      t.integer :pay_num
      t.datetime :pay_time
      t.integer :total_count
      t.integer :left_count

      t.timestamps null: false
    end
    add_foreign_key :pay_records, :customers
    add_foreign_key :pay_records, :products
    add_foreign_key :pay_records, :shops
  end
end
