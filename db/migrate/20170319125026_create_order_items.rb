class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.integer :unit_price, precision: 12, scale: 3
      t.integer :quantity
      t.integer :total_price, precision: 12, scale: 3

      t.timestamps
    end
  end
end
