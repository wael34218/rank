object @account

attributes :id, :first_name, :last_name, :nickname, :phone, :moves_count, :joker_count, :social_score

if @friends_info.present? and @friends_info.keys.include?(locals[:object].id)
  node(:friend){ true }
  node(:bond){ @friends_info[locals[:object].id][:bond] }
  node(:rank){ @friends_info[locals[:object].id][:rank] }
else
  node(:friend){ false }
end
