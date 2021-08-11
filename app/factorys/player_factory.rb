require './app/models/player'

class AnimaliaBot
	module Listener
		module PlayerFactory
			def get_or_add_player_from(message)
				from = message.from
				player = Player.find_by(village_id: Listener.village.id, telegram_chat: from.id)
				if player.nil?
					player = Player.new(telegram_chat: from.id, village_id: Listener.village.id, first_name: from.first_name, last_name: from.last_name, mode: ModeValues::REGISTER)
					player.save
				elsif player.first_name != from.first_name || player.last_name != from.last_name
					player.first_name = from.first_name
					player.last_name = from.last_name
					player.save
				end
				player
			end
			
			module_function(
				:get_or_add_player_from
			)
		end
	end
end