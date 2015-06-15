class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :mobile
      t.string :address
      t.text :description
      t.integer :gender, null: false, default: 0
      t.string :nick_name
      t.string :password

      t.timestamps null: false
    end
  end
end
