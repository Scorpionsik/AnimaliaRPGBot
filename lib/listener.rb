class AnimaliaBot
	module Listener
		attr_accessor :message, :bot, :player, :village
		
		def catch_new_message(message, bot)
			self.message = message
			self.bot = bot
		
			return false if Security.message_too_far
			
			self.village = VillageFactory.get_or_add_village_from self.message
			self.player = PlayerFactory.get_or_add_player_from self.message
			
			case self.message
			when Telegram::Bot::Types::CallbackQuery
				CallbackMessages.process
			when Telegram::Bot::Types::Message
				StandartMessages.process
			end
		end
		
	
		module_function(
		:catch_new_message,
		:message,
		:message=,
		:bot,
		:bot=,
		:player,
		:player=,
		:village,
		:village=,
		)
	end
end