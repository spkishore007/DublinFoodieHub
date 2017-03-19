class ChangeStoreDetailAddon < ActiveRecord::Migration[5.1]
  def change
    rename_column :addons, :store_details_id, :store_detail_id
  end
end
