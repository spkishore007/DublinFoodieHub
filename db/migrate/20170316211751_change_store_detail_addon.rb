class ChangeStoreDetailAddon < ActiveRecord::Migration[5.1]
  def change
    rename_column :addons, :storeDetail_id, :store_detail_id
  end
end
