json.extract! store_detail, :id, :storeName, :building, :street, :city, :pincode, :storeMobile, :storeEmail, :created_at, :updated_at
json.url store_detail_url(store_detail, format: :json)
