object @account

attributes :id, :first_name, :last_name, :nickname, :phone, :moves_count, :joker_count, :social_score

node(:avatar) do |account|
  "#{Rails.application.config.action_controller.asset_host}#{account.avatar.url(:large)}"
end

if @friends_info.present? and @friends_info.keys.include?(locals[:object].id)
  node(:friend){ true }
  node(:bond){ @friends_info[locals[:object].id][:bond] }
  node(:rank){ @friends_info[locals[:object].id][:rank] }
else
  node(:friend){ false }
end
