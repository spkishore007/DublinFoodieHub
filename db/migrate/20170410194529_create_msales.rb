class CreateMsales < ActiveRecord::Migration[5.1]
  def change
    create_table :msales do |t|
      t.string :month
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
