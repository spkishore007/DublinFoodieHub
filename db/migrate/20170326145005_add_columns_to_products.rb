class AddColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description, :string
    add_column :products, :foodType, :string
    add_column :products, :foodSize, :string
    add_column :products, :offerPrice, :decimal
    add_column :products, :quantityAvailable, :deciaml
    add_column :products, :allergens, :string
    add_column :products, :ingredients, :string
    add_column :products, :calorie, :string
    add_column :products, :hit, :decimal
  end
end
