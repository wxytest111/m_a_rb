class CreateProductDetails < ActiveRecord::Migration
  def change
    create_table :product_details do |t|
      t.string :name
      t.text :description
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_details, :products
  end
end
