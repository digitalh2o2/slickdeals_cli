class SlickdealsCli::CLI

	def call
		welcome		
		user_choice
	end

	def welcome
		puts "***************************************"
		puts "Welcome to your Slickdeals of the day!!"
		puts "***************************************"
		puts "What type of deals would you like to see?"
		puts "Input 'Featured' for today's Featured Deals or 'Frontpage' for the Frontpage deals!"
	end

	def user_choice
		input = gets.strip
		puts input
	end

end