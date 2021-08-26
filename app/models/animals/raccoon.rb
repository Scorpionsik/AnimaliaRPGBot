require_relative "animal"

class Raccoon < Animal
	def self.type_value
		"Енот"
	end
	
	def pet
		phrases = [super, "Машет полосатым хвостом!", "Похоже, он пытался что то стянуть из ваших карманов!"]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end