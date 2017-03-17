class ChangeStoreDetail < ActiveRecord::Migration[5.1]
  def change
    rename_column :foods, :storeDetail_id, :store_detail_id
  end
end
