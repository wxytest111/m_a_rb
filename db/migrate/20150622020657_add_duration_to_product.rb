class AddDurationToProduct < ActiveRecord::Migration
  def change
    add_column :products, :duration, :string
    add_column :products, :original_price, :integer
    add_column :products, :current_price, :integer
    add_column :products, :service_pic, :string
    add_column :products, :applicable, :string
    add_column :products, :effect, :string
  end
end
