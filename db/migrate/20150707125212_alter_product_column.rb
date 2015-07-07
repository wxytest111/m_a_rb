class AlterProductColumn < ActiveRecord::Migration
  def change
    change_column :products, :applicable, :text
    change_column :products, :effect, :text
  end
end
