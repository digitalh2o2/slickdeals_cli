class SlickdealsCli::Popular
	attr_accessor :name, :url, :seller

	@@all = []

	def initialize(deal_hash)
		deal_hash.each {|attr, value| self.send(("#{attr}="),value)}
		@@all << self
	end

	def self.create_popular_deal(pop_slick)
		pop_slick.each do |deal_hash|
			self.new(deal_hash)
		end
	end

	def self.all
		@@all
	end

end