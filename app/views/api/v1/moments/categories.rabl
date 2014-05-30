collection @moment_categories, :root => "moment_categories", :object_root => false

extends "api/v1/moments/category"
attributes :id, :text, :created_at

node(:photo) do |moment_category|
  "http:#{Rails.application.config.action_controller.asset_host}#{moment_category.photo.url(:large)}"
end
