class SlickdealsCli::CLI

	def call
		popular_slickdeals
		woot_deals
		welcome		
		user_choice
		goodbye
	end

	def welcome
		puts "***************************************"
		puts "Welcome to your Slickdeals of the day!!"
		puts "***************************************"
		puts "What type of deals would you like to see?"	
	end

	def popular_slickdeals
		pop_slick = SlickdealsCli::Deal.scrape_popular_slickdeals
		@pop_deals = SlickdealsCli::Popular.create_popular_deal(pop_slick)
	end

	def woot_deals
		@deals = SlickdealsCli::Deal.feature
	end

	def user_choice
		input = nil
		while input != "exit"
			puts "Type 1 for today's Popular Deals or 2 for the Deal of the day from Woot or exit:"
			input = gets.strip.downcase
			if input.to_i == 1
				popular_deal = @pop_deals
				puts popular_deal
				#puts "You can find this deal at #{popular_deal.url}"
			elsif input.to_i == 2
				woot_deal = @deals[input.to_i-1]
				puts "Here are the deals from Woot!"
				puts "#{woot_deal.name}: #{woot_deal.price}."
				puts "You can find this deal at #{woot_deal.url}"
			else
				puts "Hmm, I'm not familiar with that input"
			end
		end
	end

	def goodbye
		puts "Come back tomorrow for more deals! Have a nice day!"
	end

end