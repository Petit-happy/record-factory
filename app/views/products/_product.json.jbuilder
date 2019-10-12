json.extract! product, :id, :genre_id, :label_id, :artist_id, :photo_id, :product_price, :sales_status, :product_name, :is_deleted, :created_at, :updated_at
json.url product_url(product, format: :json)
