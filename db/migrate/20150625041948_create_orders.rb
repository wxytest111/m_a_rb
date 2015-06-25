class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :mobile
      t.string :other_name
      t.string :other_mobile
      t.references :street, index: true
      t.string :address
      t.string :postscript
      t.datetime :order_time
      t.integer :status

      t.timestamps null: false
    end
    add_foreign_key :orders, :streets
  end
end
