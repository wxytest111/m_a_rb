class CreateCheckCodes < ActiveRecord::Migration
  def change
    create_table :check_codes do |t|
      t.string :code
      t.string :mobile

      t.timestamps null: false
    end
  end
end
