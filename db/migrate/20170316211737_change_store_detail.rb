class ChangeStoreDetail < ActiveRecord::Migration[5.1]
  def change
    rename_column :foods, :store_details_id, :store_detail_id
  end
end
