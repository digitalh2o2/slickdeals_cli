class SlickdealsCli::Deal
	attr_accessor :name, :price, :url, :seller

	def self.feature
		# This will call the scrape_deals method to scrape the slickdeals popular deals page
		self.scrape_populardeals
	end

	def self.scrape_populardeals
		popular_deals = []

		popular_deals << self.scrape_popular_slickdeals
		popular_deals << self.scrape_woot
		# Will go to Slickdeals.net and scrape the Popular deals page and Woot homepage
		# Extract the information
		# Present to the user the Deals

		popular_deals
	end

	def self.scrape_popular_slickdeals
		doc = Nokogiri::HTML(open("http://slickdeals.net/deals/"))
		pop_slick = []
		doc.css("div.box.popularDeal").each do |popular|
			popular.css("div.dealRow").css("div.mainDealInfo").each do |deals|
			 	deal_hash = {}
				name = deals.css("div.titleAndLinks").css("div.dealTitle").css("a").text
			 	url = "http://www.slickdeals.net" + deals.css("div.titleAndLinks").css("div.dealTitle").css("a").attr("href").value
			 	seller_info = deals.css("div.titleAndLinks").css("div.dealLinks").css("a").first.text
			 	seller = seller_info.gsub("More", "").gsub("Deals", "").strip
			 	deal_hash[:name] = name
			   	deal_hash[:url] = url
			   	deal_hash[:seller] = seller
			   	pop_slick << deal_hash
			end
		end	
		pop_slick	
	end

	def self.scrape_woot	
		doc = Nokogiri::HTML(open("https://woot.com"))

		deal = self.new
		deal.name = doc.search("h2.main-title").text
		deal.price = doc.search("#todays-deal span.price").text
		deal.url = doc.search("a.wantone").attr("href").value
		deal
	end

end