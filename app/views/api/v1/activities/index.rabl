node(:total) {|m| @activities.total_count }
node(:total_pages) {|m| @activities.num_pages }

node :activities do
  @activities.map do |activity|
    partial("api/v1/activities/show", object: activity)
  end
end
