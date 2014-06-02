object @favourite_category

attributes :id, :title, :created_at

node(:photo) do |favourite_category|
  "http:#{Rails.application.config.action_controller.asset_host}#{favourite_category.photo.url(:large)}"
end
