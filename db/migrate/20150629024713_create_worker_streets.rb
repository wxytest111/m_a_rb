class CreateWorkerStreets < ActiveRecord::Migration
  def change
    create_table :worker_streets do |t|
      t.references :worker, index: true
      t.references :street, index: true

      t.timestamps null: false
    end
    add_foreign_key :worker_streets, :workers
    add_foreign_key :worker_streets, :streets
  end
end
