json.array!(@favourite_categories) do |favourite_category|
  json.extract! favourite_category, :id, :title
  json.url favourite_category_url(favourite_category, format: :json)
end
