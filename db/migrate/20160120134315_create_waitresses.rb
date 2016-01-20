class CreateWaitresses < ActiveRecord::Migration
  def change
    create_table :waitresses do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
