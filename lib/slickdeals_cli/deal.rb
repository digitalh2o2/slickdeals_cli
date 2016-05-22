class SlickdealsCli::Deal
	attr_accessor :name, :price, :url, :seller

	def self.feature
		# This will call the scrape_deals method to scrape the slickdeals homepage
		self.scrape_populardeals
	end

	def self.scrape_populardeals
		popular_deals = []

		#popular_deals << self.scrape_popular_slickdeals
		popular_deals << self.scrape_woot
		# Will go to Slickdeals.net and scrape both the Frontpage deals and Featured Deals
		# Extract the information
		# Present to the user the Deals

		popular_deals
	end

	def self.scrape_popular_slickdeals
		doc = Nokogiri::HTML(open("http://slickdeals.net/deals/"))
		#binding.pry
		#doc.css("div.box.popularDeal").each do |popular|
			#popular.css("div.dealRow").css("div.mainDealInfo").each do |deals|
			#	name = deals.css("div.titleAndLinks").css("div.dealTitle").css("a").text
			#end
		#end		
	end

	def self.scrape_woot	
		doc = Nokogiri::HTML(open("https://woot.com"))
		#binding.pry

		deal = self.new
		deal.name = doc.search("h2.main-title").text
		deal.price = doc.search("#todays-deal span.price").text
		deal.url = doc.search("a.wantone").attr("href").value
		deal
	end

end