class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name
      t.string :mobile
      t.string :avatar
      t.float :star
      t.integer :gender, null: false, default: 0
      t.text :description
      t.string :skills

      t.timestamps null: false
    end
  end
end
