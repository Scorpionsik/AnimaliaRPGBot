require './app/models/animals/animal'

class AnimaliaBot
	module Listener
		module AnimalFactory
			def max_animals_for_player
				6
			end
		
			def animals_collection
			[
				'Beaver',
				'Deer',
				'Fox',
				'Owl',
				'Raven',
				'Squirrel',
			]
			end
			
			def animals_type_values
				result = {}
				animals_collection.each {|key| result[key] = Object.const_get(key).type_value}
				result
			end
			
			def get_animal_type_value(key)
				Object.const_get(key).type_value
			end
			
			def add_animal_by(key)
				result = false
				if Animal.where(village_id: Listener.village.id, player_id: Listener.player.id).size <= self.max_animals_for_player
					animal = Object.const_get(key).new(village_id: Listener.village.id, player_id: Listener.player.id)
					animal.save
					Listener.player.update(select_animal: animal.id) if Listener.player.select_animal.nil?
					puts "#{animal.id} - #{Listener.player.select_animal}" #TODO remove it
					result = true
				end
				result
			end
			
			module_function(
				:animals_collection,
				:animals_type_values,
				:max_animals_for_player,
				:add_animal_by
			)
		end
	end
end