object @moment_category

attributes :id, :text, :created_at

node(:photo) do |moment_category|
  "#{Rails.application.config.action_controller.asset_host}#{moment_category.photo.url(:large)}"
end
