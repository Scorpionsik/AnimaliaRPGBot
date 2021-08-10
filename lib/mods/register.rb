class AnimaliaBot
	module Listener
		module Mode
			module Register
				
			
				def standart_message(message)
					#self.empty_message(message.text)
					if Listener.player.animals.nil? || Listener.player.animals.length == 0
						
						Listener::Response.inline_message("Для начала стоит выбрать себе питомца!", InlineKeyboard.get_inline_from(InlineKeyboard::REG_CHOICE_MENU))
					else
						self.change_mod
					end
				end
			
				def callback_message(message, callback)
					#self.empty_message(callback)
					if callback == 'start_choice_manual'
						Listener::Response.inline_message("Выбирай на вкус!", InlineKeyboard.make_callback_data_kb_from(Listener::AnimalFactory.animals_type_values))
					else
						is_success = false;
						if callback == 'start_choice_random'
							#self.empty_message(callback)
							chosen_list = Listener::AnimalFactory.animals_collection
							chosen_key = chosen_list[rand(chosen_list.length)]
							is_success = Listener::AnimalFactory.add_animal_by chosen_key
						else
							is_success = Listener::AnimalFactory.add_animal_by callback
						end
						if is_success
							self.success_reg_message
							self.change_mod
						end
					end
				end
				
				def success_reg_message
					Listener::Response.std_message("Вы выбрали питомца, это #{Listener.player.animals.last.type_value}! Поздравляем!")
				end
				
				def change_mod
					Listener.player.update(mode: Listener::ModeValues::MAIN)
					Listener.player.save
				end
				
				def empty_message(text)
					Listener::Response.std_message("#{Listener.player.mode} - #{text}")
				end
				
				module_function(
					:standart_message,
					:callback_message,
					:empty_message,
					:success_reg_message,
					:change_mod
				)
			end
		end
	end
end