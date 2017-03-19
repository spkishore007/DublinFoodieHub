class CreateAddons < ActiveRecord::Migration[5.1]
  def change
    create_table :addons do |t|
      t.string :addonName
      t.string :addonType
      t.integer :addonPrice
      t.integer :hit
      t.references :store_details, foreign_key: true

      t.timestamps
    end
  end
end
