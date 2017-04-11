class AddColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :description, :string
    add_column :products, :foodType, :string
    add_column :products, :foodSize, :string
    add_column :products, :offerPrice, :integer
    add_column :products, :quantityAvailable, :integer
    add_column :products, :allergens, :string
    add_column :products, :ingredients, :string
    add_column :products, :calorie, :integer
    add_column :products, :hit, :integer
    add_column :products, :count, :integer
  end
end
