json.array!(@favourite_presets) do |favourite_preset|
  json.extract! favourite_preset, :id, :title, :favourite_category_id
  json.url favourite_preset_url(favourite_preset, format: :json)
end
