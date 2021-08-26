require_relative "animal"

class Nightingale < Animal
	def self.type_value
		"Соловей"
	end
	
	def pet
		phrases = [super, "Чирикает и щебечет от ваших ласк!", "Чистит пёрышки и клювик."]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end