json.extract! listing, :id, :title, :price, :sex, :color, :brand, :description, :category_id, :condition, :size, :created_at, :updated_at
json.url listing_url(listing, format: :json)
