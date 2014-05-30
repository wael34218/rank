object @ranking

attributes :id, :rank_change, :yes, :no, :yes_ids, :no_ids, :urgent, :created_at

node(:tool) {|ranking| Ranking::TOOLS[ranking.tool.to_i]}
node(:status) {|ranking| Ranking::STATUSES[ranking.status.to_i]}

child :subject, :root => "subject" do
  extends "api/v1/accounts/show"
end

child :target, :root => "target" do
  extends "api/v1/accounts/show"
end

child :ranked, :root => "ranked" do
  extends "api/v1/accounts/show"
end

