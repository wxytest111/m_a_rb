class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :uuid
      t.string :title
      t.string :name
      t.integer :sex
      t.string :tel
      t.string :email
      t.string :creid
      t.string :company
      t.string :login_name
      t.string :login_pass
      t.integer :subshop_count
      t.integer :level

      t.timestamps null: false
    end
  end
end
