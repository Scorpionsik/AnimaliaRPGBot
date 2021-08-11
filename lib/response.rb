class AnimaliaBot
	module Listener
		module Response
			def std_message(text, chat_id = false)
				chat = Listener.village.telegram_chat
				chat = chat_id if chat_id
				Listener.bot.api.send_message(
					parse_mode: 'html',
					chat_id: chat,
					text: text
				)
			end
			
			def inline_message(text, inline_markup, chat_id = false)
				chat = Listener.village.telegram_chat
				chat = chat_id if chat_id
				#puts chat
				#puts "#{chat}: #{text}\r\n#{inline_markup}"
				Listener.bot.api.send_message(
					chat_id: chat,
					parse_mode: 'html',
					text: text,
					reply_markup: inline_markup
				)
			end
			
			def edit_std_message(new_text, message = false, chat_id = false)
				message_id = Listener.message.message_id
				message_id = message.message_id if message
				
				chat = Listener.village.telegram_chat
				chat = chat_id if chat_id
				Listener.bot.api.edit_message_text(
					chat_id: chat, 
					message_id: message_id, 
					parse_mode: 'html',
					text: new_text,
					)
			end
			
			def edit_inline_message(new_text, new_inline_markup, message = false, chat_id = false)
				message_id = Listener.message.message.message_id
				message_id = message.message_id if message
				
				chat = Listener.village.telegram_chat
				chat = chat_id if chat_id
				
				Listener.bot.api.edit_message_text(
					chat_id: chat,
					message_id: message_id, 
					parse_mode: 'html',
					text: new_text,
					reply_markup: new_inline_markup
				)
			end
			
			def generate_inline_markup(kb, force = false)
				Telegram::Bot::Types::InlineKeyboardMarkup.new(
					inline_keyboard: kb
				)
			end
			
			module_function(
				:std_message,
				:inline_message,
				:edit_std_message,
				:edit_inline_message,
				:generate_inline_markup
			)
		end
	end
end