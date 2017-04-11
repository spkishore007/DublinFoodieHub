class AddStoreDetailToProduct < ActiveRecord::Migration[5.1]
 def change
    add_column :products, :store_detail_id, :integer
    add_column :comments, :product_id, :integer
 end
end
