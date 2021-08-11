require './app/models/rpg_attribute'
require './app/enums/attribute_param'

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
				if Listener.player.animals.size <= self.max_animals_for_player
					animal = Object.const_get(key).new(village_id: Listener.village.id)
					Listener.player.animals << animal
					roll_attributes_for animal if animal.rpg_attribute.nil?
					animal.save
					Listener.player.update(select_animal: animal.id) if Listener.player.select_animal.nil?
					
					result = true
				end
				result
			end
			
			def roll_attributes_from(animal)
				attribute_hash = animal.get_attribute_params
				RpgAttribute.create(animal_id: animal.id,
				strength: rand(attribute_hash[:strength]),
				dexterity: rand(attribute_hash[:dexterity]),
				constitution: rand(attribute_hash[:constitution]),
				intelligence: rand(attribute_hash[:intelligence]),
				charisma: rand(attribute_hash[:charisma]),
				luck: rand(attribute_hash[:luck])
				)
				
			end
			
			module_function(
				:animals_collection,
				:animals_type_values,
				:max_animals_for_player,
				:add_animal_by,
				:roll_attributes_from
			)
		end
	end
end