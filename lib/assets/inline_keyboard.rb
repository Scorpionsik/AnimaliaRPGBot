class AnimaliaBot
	module InlineKeyboard
		REG_CHOICE_MENU = [
				[Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Выбрать зверька', callback_data: 'start_choice_manual')],
				[Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Мне повезет!', callback_data: 'start_choice_random')]
			]
		#REG_CHOICE_ANIMAL = [
		#	[
		#		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Бобер', callback_data: 'beaver'),
		#		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Лань', callback_data: 'deer')
		#	],
		#	[
		#		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Лиса', callback_data: 'fox'),
		#		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Сова', callback_data: 'owl')
		#	],
		#	[
		#		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Ворон', callback_data: 'raven'),
		#		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Белка', callback_data: 'squirrel')
		#	]
		#]
		
		def make_callback_data_kb_from(hash, buttons_on_line = 2)
			keyboard = hash.map do |key, value|
				Telegram::Bot::Types::InlineKeyboardButton.new(text: value, callback_data: key)
			end
			
			self.get_inline_from keyboard.each_slice(buttons_on_line).to_a
		end
		
		def get_inline_from(arr)
			keyboard = Telegram::Bot::Types::InlineKeyboardMarkup.new
			keyboard.inline_keyboard = arr
			keyboard
		end
		module_function(
			:get_inline_from,
			:make_callback_data_kb_from
		)
	end
end