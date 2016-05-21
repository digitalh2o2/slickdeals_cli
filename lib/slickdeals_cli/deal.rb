class SlickdealsCli::Deal
	attr_accessor :name, :price, :url, :seller

	def self.feature
		# This should return a bunch of instances of deals
		puts "Here are the front page deals"
		fpdeal_1 = self.new
		fpdeal_1.name = "Running Shoes"
		fpdeal_1.price = "$45"
		fpdeal_1.url = "http://www.slickdeals.net"
		fpdeal_1.seller = "Nike"

		[fpdeal_1]
	end

end