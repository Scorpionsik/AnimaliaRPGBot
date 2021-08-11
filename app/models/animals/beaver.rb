require_relative "animal"

class Beaver < Animal
	def self.type_value
		"Бобер"
	end
	
	def pet
		phrases = [super, "Ваш бобрик бъёт хвостом об пол от удовольствия!", "Кажется, он спал, но все равно рад вашему вниманию!"]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end