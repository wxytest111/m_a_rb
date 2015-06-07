class CreateBeauticians < ActiveRecord::Migration
  def change
    create_table :beauticians do |t|
      t.string :name
      t.string :mobile
      t.string :id_card

      t.timestamps null: false
    end
  end
end
