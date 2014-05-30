json.array!(@moment_categories) do |moment_category|
  json.extract! moment_category, :id, :text
  json.url moment_category_url(moment_category, format: :json)
end
