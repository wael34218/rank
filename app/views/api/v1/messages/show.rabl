object @message

attributes :id, :text, :created_at

node(:photo) {|message| "#{Rails.application.config.action_controller.asset_host}#{message.photo.url(:large)}"}

child :subject, :root => "subject" do
  extends "api/v1/accounts/show"
end

child :target, :root => "target" do
  extends "api/v1/accounts/show"
end
