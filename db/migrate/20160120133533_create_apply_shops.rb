class CreateApplyShops < ActiveRecord::Migration
  def change
    create_table :apply_shops do |t|
      t.string :name
      t.integer :sex
      t.string :tel
      t.string :email
      t.string :creid
      t.string :company
      t.references :shop, index: true
      t.integer :state

      t.timestamps null: false
    end
    add_foreign_key :apply_shops, :shops
  end
end
