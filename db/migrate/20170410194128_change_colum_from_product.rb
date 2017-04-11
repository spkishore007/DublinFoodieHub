class ChangeColumFromProduct < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, :integer
    change_column :products, :hit, :integer
    change_column :products, :offerPrice, :integer
    change_column :products, :quantityAvailable, :integer
    change_column :order_items, :unit_price, :integer
    change_column :order_items, :total_price, :integer
    add_column :products, :count, :integer
  end
end
