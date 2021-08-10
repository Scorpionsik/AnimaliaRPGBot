require './app/models/village'

class AnimaliaBot
	module Listener
		module VillageFactory
			def get_or_add_village_from(message)
				chat = (defined? message.chat) ? message.chat : message.message.chat
				village = Village.find_by(telegram_chat: chat.id)
				if(village.nil?)
					village = Village.new(name: chat.title, telegram_chat: chat.id)
					village.save
				elsif village.name != chat.title
					village.name = chat.title 
					village.save
				end
				village
			end
			
			module_function(
				:get_or_add_village_from
			)
		end
	end
end