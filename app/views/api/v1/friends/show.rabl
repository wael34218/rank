object @friend

attributes :rank

child :account, :root => "account" do
  extends "api/v1/accounts/show"
end

child :friend, :root => "friend" do
  extends "api/v1/accounts/show"
end
