class ChangeTypeOfCalorie < ActiveRecord::Migration[5.1]
  def change
  	change_column :products, :calorie, :integer
  end
end
