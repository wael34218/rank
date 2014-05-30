@activity = locals[:object] if @activity.blank?
object @activity 

case @activity.activity_type
when "ranking"
  node :ranking do
    partial("api/v1/rankings/show", :object => @activity) 
  end
when "message"
  node :message do
    partial("api/v1/messages/show", :object => @activity) 
  end
when "moment"
  node :moment do
    partial("api/v1/moments/show", :object => @activity) 
  end
else
  node :unknown do
    "Nani - #{@activity.activity_type}"
  end
end
