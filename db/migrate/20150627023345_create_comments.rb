class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :order, index: true
      t.string :description

      t.timestamps null: false
    end
    add_foreign_key :comments, :orders
  end
end
