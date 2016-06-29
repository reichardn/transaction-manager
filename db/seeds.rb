user = User.create(:name => "nick", :password => "nick")

deal = Deal.create(:name => "wayne enterprises", :user_id => user.id)

Task.create(:description => "merger agreement", :complete => false, :deal_id => deal.id)
Task.create(:description => "tax issues", :complete => false, :deal_id => deal.id)


user2 = User.create(:name => "dave", :password => "dave")

deal2 = Deal.create(:name => "time warner", :user_id => user2.id)

Task.create(:description => "merger agreement", :complete => false, :deal_id => deal2.id)
Task.create(:description => "tax issues", :complete => false, :deal_id => deal2.id)