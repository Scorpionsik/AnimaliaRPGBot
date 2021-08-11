require_relative "animal"

class Raven < Animal
	def self.type_value
		"Ворон"
	end
	
	def pet
		phrases = [super, "Кажется он щёлкает клювом от удовольствия!", "Явно не ожидав ласки сейчас, удивленно смотрит на вас."]
		vars = [1,1,1,0,2]
		phrases[vars[rand(vars.length)]]
	end
end