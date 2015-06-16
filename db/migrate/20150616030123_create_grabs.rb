class CreateGrabs < ActiveRecord::Migration
  def change
    create_table :grabs do |t|
      t.references :worker, index: true
      t.references :appointment, index: true
      t.integer :status, null:false, default: 0

      t.timestamps null: false
    end
    add_foreign_key :grabs, :workers
    add_foreign_key :grabs, :appointments
  end
end
