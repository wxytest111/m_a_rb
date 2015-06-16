class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :status, null: false, default: 0
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :address
      t.references :product, index: true
      t.references :service, index: true
      t.references :customer, index: true

      t.timestamps null: false
    end
    add_foreign_key :appointments, :products
    add_foreign_key :appointments, :services
    add_foreign_key :appointments, :customers
  end
end
