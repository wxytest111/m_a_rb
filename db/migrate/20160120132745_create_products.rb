class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.text :period
      t.text :effect
      t.text :applicable
      t.integer :kind
      t.integer :howuse
      t.integer :total_count
      t.string :pic_path
      t.integer :show_price
      t.integer :pay_price
      t.integer :state
      t.references :admin, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :admins
  end
end
