class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :passwd
      t.integer :kind

      t.timestamps null: false
    end
  end
end
