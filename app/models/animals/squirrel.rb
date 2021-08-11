require_relative "animal"

class Squirrel < Animal
	def self.type_value
		"Белка"
	end
	
	def pet
		phrases = [super, "Переворачивается, поставляя животик и дрыгая лапками!", "Кажется ей нравится играть с вашими пальцами!"]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end