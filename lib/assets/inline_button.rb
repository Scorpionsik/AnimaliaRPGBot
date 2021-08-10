class AnimaliaBot
	module InlineButton
		GET_ANIMAL = Telegram::Bot::Types::InlineKeyboardButton.new(text: "Приручить зверька!", callback_data: "get_animal")
		
		def make_set_name(animal_id)
			Telegram::Bot::Types::InlineKeyboardButton.new(text: "Дать имя", callback_data: "set_name_animal_#{animal_id}")
		end
		
		def make_set_class(animal_id)
			Telegram::Bot::Types::InlineKeyboardButton.new(text: "Дать класс", callback_data: "set_class_animal_#{animal_id}")
		end
		
		module_function(
			:make_set_name,
			:make_set_class
		)
	end
end