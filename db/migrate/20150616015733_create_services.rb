class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.float :price
      t.text :description
      t.string :pic
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
