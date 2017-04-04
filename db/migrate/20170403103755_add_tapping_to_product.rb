class AddTappingToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :tapping, :text, array: true
  end
end
