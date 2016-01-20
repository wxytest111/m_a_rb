class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :uin
      t.string :passwd
      t.string :name
      t.integer :sex
      t.string :tel
      t.string :address
      t.references :district, index: true

      t.timestamps null: false
    end
    add_foreign_key :customers, :districts
  end
end
