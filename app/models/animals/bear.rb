require_relative "animal"

class Bear < Animal
	def self.type_value
		"Медведь"
	end
	
	def pet
		phrases = [super, "Шевелит ушами от удовольствия!", "Кажется, он решил покувыркаться вокруг вас!"]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end