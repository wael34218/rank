if @friends.present?
  node(:total) {|m| @friends.total_count }
  node(:total_pages) {|m| @friends.num_pages }
else
  node(:total) {|m| @accounts.total_count }
  node(:total_pages) {|m| @accounts.num_pages }
end

node :accounts do
  @accounts.map do |account|
    partial("api/v1/accounts/show", object: account)
  end
end
