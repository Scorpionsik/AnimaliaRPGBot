class AnimaliaBot
	module Listener
		module CallbackMessages
			
			def process
				distribute_by_mods
			end
			
			def distribute_by_mods
				case Listener.player.mode
				when Listener::ModeValues::REGISTER
					Listener::Mode::Register.callback_message(Listener.message.message, Listener.message.data)
				when Listener::ModeValues::MAIN
					Listener::Mode::Main.callback_message(Listener.message.message,  Listener.message.data)
				end
			end
			
			def get_animals_hash
				{'beaver' => Beaver.new, 'deer' => Deer.new, 'fox' => Fox.new, 'owl' => Owl.new, 'raven' => Raven.new, 'squirrel' => Squirrel.new}
			end
			
			def set_choosed_animal(animal_id)
				Listener::Response.std_message("Ты выбрал(а) питомца! Это #{get_animals_hash[animal_id].type_value}!")
			end

			
			module_function(
				:process,
				:get_animals_hash,
				:set_choosed_animal,
				:distribute_by_mods
			)
			
			
			
			
		end
	end
end