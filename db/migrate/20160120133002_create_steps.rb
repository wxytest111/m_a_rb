class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :number
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :steps, :products
  end
end
