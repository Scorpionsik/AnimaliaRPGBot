require 'telegram/bot'
require './config/sqlite3_init_activerecord'
require './config/precious'
require './db/schema'
require './lib/listener'
require './lib/security'
require './lib/standart_messages'
require './lib/callback_messages'
require './lib/assets/inline_button'
require './lib/assets/inline_keyboard'
require './lib/response'
require './lib/mods/mode_values'
require './lib/mods/mode'
require './lib/mods/register'
require './lib/mods/main'
require './app/factorys/animal_factory'
require './app/factorys/player_factory'
require './app/factorys/village_factory'

class AnimaliaBot
	include Schema
	
	def initialize
		super
		print "Get database..."
		Schema.setup
		puts " Done!"
		
		Telegram::Bot::Client.run(GiveMeMyPrecious::API_KEY) do |bot|
			start_bot_time = Time.now
			puts "AnimaliaBot has been started at #{start_bot_time}!"
			bot.listen do |message|
				puts "-=-= #{Time.now} =-=-\n@text"
				p message
				puts "-=-=-=-=-\n\n"
				case message
				when Telegram::Bot::Types::InlineQuery
					puts message.id
					puts message.from
					puts message.query
					puts message.offset
				else
					Listener.catch_new_message(message, bot) if Listener::Security.message_is_new(start_bot_time.to_i, message)
				end
			end
		end
	end
end