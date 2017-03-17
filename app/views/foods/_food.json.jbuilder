json.extract! food, :id, :foodName, :foodType, :foodSize, :actualPrice, :offerPrice, :quantityAvailable, :hit, :storeDetail_id, :created_at, :updated_at
json.url food_url(food, format: :json)
