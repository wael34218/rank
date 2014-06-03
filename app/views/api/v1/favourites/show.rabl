object @favourite

attributes :id, :created_at, :account_id, :favourite_preset_id

node(:title) do |favourite|
  favourite.display_title
end

node(:photo) do |favourite|
  "#{Rails.application.config.action_controller.asset_host}#{favourite.display_photo.url(:large)}"
end

child :favourite_category, :root => "category" do
  extends "api/v1/favourites/category"
end
