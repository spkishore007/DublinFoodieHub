class AddMemberIdToStoreDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :store_details, :member, foreign_key: true
  end
end
