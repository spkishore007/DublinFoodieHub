class CreateDsales < ActiveRecord::Migration[5.1]
  def change
    create_table :dsales do |t|
      t.date :day
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
