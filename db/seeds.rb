10.times do 
	gossip = Gossip.create!(anonymous_author: Faker::Name.first_name, content: Faker::Community.quotes, user_id: rand(1..User.count))
end