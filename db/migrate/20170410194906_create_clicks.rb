class CreateClicks < ActiveRecord::Migration[5.1]
  def change
    create_table :clicks do |t|
      t.integer :product_identity
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
