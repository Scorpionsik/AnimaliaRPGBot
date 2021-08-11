require_relative "animal"

class Owl < Animal
	def self.type_value
		"Сова"
	end
	
	def pet
		phrases = [super, "Она закатывает глаза, ухая от удовольствия!", "Приотрыв один глаз и тихо ухнув, даёт понять, что она сейчас спит."]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end