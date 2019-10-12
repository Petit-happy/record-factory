json.extract! cart_item, :id, :end_user_id, :product_id, :cart_sum, :cart_sum, :created_at, :updated_at
json.url cart_item_url(cart_item, format: :json)
