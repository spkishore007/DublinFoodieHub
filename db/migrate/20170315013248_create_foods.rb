class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :foodName
      t.string :foodType
      t.string :foodSize
      t.integer :actualPrice
      t.integer :offerPrice
      t.integer :quantityAvailable
      t.integer :hit
      t.references :storeDetail, foreign_key: true

      t.timestamps
    end
  end
end
