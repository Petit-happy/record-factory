json.extract! order, :id, :end_user_id, :delivery_cost, :total_price, :order_status, :order_post_code, :order_address, :created_at, :updated_at
json.url order_url(order, format: :json)
