class CreateWsales < ActiveRecord::Migration[5.1]
  def change
    create_table :wsales do |t|
      t.string :week
      t.integer :totalSale
      t.integer :profit
      t.integer :nonVegSale
      t.integer :vegSale
      t.integer :offeredSale
      t.integer :nonOfferedSale

      t.timestamps
    end
  end
end
