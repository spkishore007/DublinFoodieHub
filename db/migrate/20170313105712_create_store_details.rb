class CreateStoreDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :store_details do |t|
      t.string :store_name
      t.string :building
      t.string :street
      t.string :city
      t.string :pincode
      t.integer :store_mobile
      t.string :store_email
      t.timestamps
    end
  end
end
