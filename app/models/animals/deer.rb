require_relative "animal"

class Deer < Animal
	def self.type_value
		"Лань"
	end
	
	def pet
		phrases = [super, "Она подставляет спинку и машет хвостиком!", "Кажется, она спала, но все равно рада вашему вниманию!"]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end