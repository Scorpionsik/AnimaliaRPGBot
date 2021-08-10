require './app/models/animals/animal'

class AnimaliaBot
	module Listener
		module Mode
			module Main
				def standart_message(message)
					#self.empty_message(message.text)
					text = message.text.downcase
					if(text.include?("мои звери"))
						animal_keyboard = []
						Listener.player.animals.each do |animal|
							name = animal.name.nil? ? "*без имени*" : "\"#{animal.name}\""
							animal_keyboard<<[Telegram::Bot::Types::InlineKeyboardButton.new(text: "#{animal.type_value} #{name}", callback_data: "animal_#{animal.id}")]
						end
						Response.inline_message("Твои звери, о #{Listener.player.first_name}!", InlineKeyboard.get_inline_from(animal_keyboard))
					elsif(text.include?("дать имя"))
						animal = Listener.player.get_select_animal
						name = message.text.match(/(?<=дать имя ).+/i).to_s
						animal.update(name: name)
						Response.std_message("#{name} - отличное имя для твоего животного!")
					elsif(text.include?("погладить"))
						animal = Listener.player.get_select_animal
						Response.std_message "#{animal.type_value} ластится и тянется к вашей ласковой руке!"
					else
						#self.empty_message(message.text)
						#Response.std_message "Ты написал(а) \"#{message.text}\""
					end
				end
			
				def callback_message(message, callback)
					if callback.include? "name"
						self.empty_message(callback)
					elsif callback.include? "animal"
						animal_id = callback.match(/\d+$/).to_s
						animal = Animal.find_by(id: animal_id)
						animal_view = self.get_animal_view(animal)
						#animal_keyboard = []
						#animal_keyboard << [InlineButton.make_set_name(animal.id)] if animal.name.nil?
						#animal_keyboard << [InlineButton.make_set_class(animal.id)] if animal.rpg_class.nil?
						#Response.inline_message(animal_view, InlineKeyboard.get_inline_from(animal_keyboard))
						Response.std_message(animal_view)
					else
						self.empty_message(callback)
					end
				end
				
				def empty_message(text)
					Listener::Response.std_message("#{Listener.player.mode} - #{text}")
				end
				
				def get_animal_view(animal)
					animal_view = "<u>#{animal.type_value} "
					animal_view += animal.name.nil? ? "*без имени*" : "\"#{animal.name}\""
					animal_view += "</u>\n\n"
					animal_view += "<b>Класс:</b> в разработке"
					#animal_view += "Класс: #{animal.rpg_class.nil? ? "нету" : animal.rpg_class}"
					animal_view
				end
				
				module_function(
					:standart_message,
					:callback_message,
					:empty_message,
					:get_animal_view
				)
			end
		end
	end
end