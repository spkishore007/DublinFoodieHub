json.extract! addon, :id, :addonName, :addonType, :addonPrice, :hit, :storeDetail_id, :created_at, :updated_at
json.url addon_url(addon, format: :json)
