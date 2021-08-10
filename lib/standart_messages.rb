class AnimaliaBot
	module Listener
		module StandartMessages
			def process
			
				case Listener.message.text
				when '/start'
					start_message = Listener.player.mode == Listener::ModeValues::REGISTER ? "Добро пожаловать" : "С возвращением"
					Response.std_message "#{start_message}, #{Listener.player.first_name}!"
					self.distribute_by_mods
				when '/help'
					Response.std_message "<b>Мои звери</b> - <i>посмотреть всех зверей</i>\n<b>Дать имя *вводи имя*</b> - <i>дать имя зверю</i>\n<b>Погладить</b> - <i>вашему зверю нравится, когда вы его гладите</i>"
				when '/key'
					Response.std_message 'Key is coming soon...'
				else
					#Response.std_message "Ты написал(а) \"#{Listener.message.text}\"!"
					self.distribute_by_mods
				end
			end
			
			def distribute_by_mods
				case Listener.player.mode
				when Listener::ModeValues::REGISTER
					Listener::Mode::Register.standart_message Listener.message
				when Listener::ModeValues::MAIN
					Listener::Mode::Main.standart_message Listener.message
				end
			end
			
			module_function(
				:process,
				:distribute_by_mods
			)
		end
	end
end