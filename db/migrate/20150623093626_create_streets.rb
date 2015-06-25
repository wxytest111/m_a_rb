class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.string :name
      t.references :area, index: true

      t.timestamps null: false
    end
    add_foreign_key :streets, :areas
  end
end
