class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.references :customer, index: true
      t.datetime :start_time
      t.datetime :end_time
      t.references :product, index: true
      t.references :pay_record, index: true
      t.string :name
      t.integer :sex
      t.string :tel
      t.references :district, index: true
      t.string :address
      t.references :waitress, index: true
      t.integer :state

      t.timestamps null: false
    end
    add_foreign_key :subscribes, :customers
    add_foreign_key :subscribes, :products
    add_foreign_key :subscribes, :pay_records
    add_foreign_key :subscribes, :districts
    add_foreign_key :subscribes, :waitresses
  end
end
