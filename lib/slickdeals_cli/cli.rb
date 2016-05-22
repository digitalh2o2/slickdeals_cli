class SlickdealsCli::CLI

	def call
		welcome		
		user_choice
		goodbye
	end

	def welcome
		puts "***************************************"
		puts "Welcome to your Slickdeals of the day!!"
		puts "***************************************"
		puts "What type of deals would you like to see?"	
		todays_deals
		#@deals = SlickdealsCli::Deal.feature
		#@deals.each.with_index(1) do |deal, i|
			#puts "#{i}: #{deal.name}"
		#end
	end

	def todays_deals
		@deals = SlickdealsCli::Deal.feature
	end

	def user_choice
		input = nil
		while input != "exit"
			puts "Type 1 for today's Popular Deals or 2 for the Deal of the day from Woot or exit:"
			input = gets.strip.downcase
			if input.to_i == 1
				popular_deal = @deals[input.to_i-1]
				puts "#{popular_deal.name}: #{popular_deal.price}."
				puts "You can find this deal at #{popular_deal.url}"
			elsif input.to_i == 2
				frontpage_deals
			else
				puts "Hmm, I'm not familiar with that input"
			end
		end
	end

	def goodbye
		puts "Come back tomorrow for more deals! Have a nice day!"
	end

end