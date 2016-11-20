
## GET ALL THE YELP SHIT FOR MASON'S BROKEN SQL DATABASE

#loc = "43201" #User location code
#idList = ["yaus-chinese-bistro-columbus","pizzarev-columbus"] #Yelp IDs to be removed

require "rubygems"
require "yelp"
require "openssl"

# Verify SSL cert
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# ^^^ Don't touch this motherfucker or shit will break ^^^

# Define Yelp client OAuth 
client = Yelp::Client.new({ consumer_key: "YhjLxF8PRpOolMd0SNxeiQ",
                            consumer_secret: "u9zEdttC6F-WKn51nZmmkuJjv7s",
                            token: "H0TRVgdMO0FCo-s_miLm9J8H-kxkXymn",
                            token_secret: "3Wi46vZES6UtIxN326eqvj7w5ws"
                           })


# Set search parameters and search Yelp
params = { sort: 1, #Sort by distance
		   category_filter: "restaurants"
		   #limit: 20,
		   #deals_filter: true,
		   #radius_filter: 40000, #Max 40000 (meters)
		   #location: loc, #This does absolutely nothing
		   #find_loc: loc
		 }

response = client.search(loc, params)


# Parse JSON and remove blacklisted IDs
# Please ignore codied diarrhea below
numFails = 0
loopItr = 0
while loopItr <= response.businesses.length-1
	for j in 0..idList.length-1
		if (response.businesses[loopItr].id) == (idList[j])
			numFails = numFails+1
			response.businesses.delete_at(loopItr)
		end
	end
	loopItr = loopItr+1
end
# End of diarrhea - thanks for your patience

puts
puts "#{numFails} item(s) to be removed"

# send output to CMD
puts
for i in 0..response.businesses.length-1
	puts "#{i+1}. #{response.businesses[i].id}"
end






