user = User.create(:name => "nick", :password => "nick")

deal = Deal.create(:name => "wayne enterprises", :user_id => user.id)

Task.create(:description => "merger agreement", :complete => false, :deal_id => deal.id)
Task.create(:description => "tax issues", :complete => false, :deal_id => deal.id)