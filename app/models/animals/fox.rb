require_relative "animal"

class Fox < Animal
	def self.type_value
		"Лиса"
	end
	
	def pet
		phrases = [super, "Она умилительно фырчит от удовольствия!", "Лисичка лижет вам руку в ответ!"]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end