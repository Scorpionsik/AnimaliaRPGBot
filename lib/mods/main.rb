require './app/models/animals/animal'

class AnimaliaBot
	module Listener
		module Mode
			module Main
				def standart_message(message)
					text = message.text.downcase
					if(text.include?("мои звери"))
						select_animal = Listener.player.get_select_animal
						Listener::AnimalFactory.roll_attributes_for select_animal if select_animal.rpg_attribute.nil? #TODO refactor this or delete
						Mode.show_view Listener::View::AnimalView.index
					elsif(text.include?("дать имя"))
						animal = Listener.player.get_select_animal
						name = message.text.match(/(?<=дать имя ).+/i).to_s
						animal.update(name: name)
						Response.std_message("#{name} - отличное имя для твоего животного!")
					elsif(text.include?("погладить"))
						animal = Listener.player.get_select_animal
						Response.std_message animal.pet
					else
						#self.empty_message(message.text)
						#Response.std_message "Ты написал(а) \"#{message.text}\""
					end
				end
			
				def callback_message(message, callback)
					if callback.include? "animal"
						animal_id = callback.match(/\d+$/).to_s.to_i
						if Listener.player.animals.find_by(id: animal_id)
							Listener.player.update(select_animal: animal_id) 
							select_animal = Listener.player.get_select_animal #TODO refactor this or delete
							Listener::AnimalFactory.roll_attributes_for select_animal if select_animal.rpg_attribute.nil? #TODO refactor this or delete
							Mode.update_view(message, Listener::View::AnimalView.index)
						end
					else
						self.empty_message(callback)
					end
				end
				
				def empty_message(text)
					Listener::Response.std_message("#{Listener.player.mode} - #{text}")
				end
				
				module_function(
					:standart_message,
					:callback_message,
					:empty_message
				)
			end
		end
	end
end