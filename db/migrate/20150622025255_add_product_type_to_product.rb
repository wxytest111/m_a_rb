class AddProductTypeToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :product_type, index: true
    add_foreign_key :products, :product_types
  end
end
