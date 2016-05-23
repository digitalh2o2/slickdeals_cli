class SlickdealsCli::CLI

	def call
		build_popular
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

	
	def user_choice
		input = nil
		while input != "exit"
			puts "Type 1 for today's Popular Deals or 2 for the Deal of the day from Woot or exit:"
			input = gets.strip.downcase
			if input.to_i == 1
				popular_deals_list
			elsif input.to_i == 2
				woot_deal = @deals[input.to_i-1]
				puts "Here is the Daily Deal from Woot!"
				puts "#{woot_deal.name}:".colorize(:light_blue) + " #{woot_deal.price}.".colorize(:green)
				puts "You can find this deal at #{woot_deal.url}".colorize(:blue)
			else
				puts "Hmm, I'm not familiar with that input"
			end
		end
	end

	def goodbye
		puts "Come back tomorrow for more deals! Have a nice day!"
	end

	private

	def build_popular
		pop_slick = SlickdealsCli::Deal.scrape_popular_slickdeals
		@pop_deals = SlickdealsCli::Popular.create_popular_deal(pop_slick)
	end

	def popular_deals_list
		puts "Here are the current Popular Deals on Slickdeals!!"
		SlickdealsCli::Popular.all.each.with_index(1) do |deal, index|
			puts "#{index}: ".colorize(:red) + "#{deal.name}".colorize(:light_blue)
			puts "You can find the deal at: " 
			puts "#{deal.url}"
			puts "The seller is #{deal.seller}.".colorize(:blue)
			puts ""
		end
	end

	def woot_deals
		@deals = SlickdealsCli::Deal.feature
	end


end