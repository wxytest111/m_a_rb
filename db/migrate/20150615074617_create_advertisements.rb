class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :url
      t.string :address

      t.timestamps null: false
    end
  end
end
