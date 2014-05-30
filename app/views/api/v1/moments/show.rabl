object @moment

attributes :id, :text, :created_at

node(:photo) {|moment| "http:#{Rails.application.config.action_controller.asset_host}#{moment.photo.url(:large)}"}

child :subject, :root => "subject" do
  extends "api/v1/accounts/show"
end

child :target, :root => "target" do
  extends "api/v1/accounts/show"
end

child :moment_category, :root => "category" do
  extends "api/v1/moments/category"
end
