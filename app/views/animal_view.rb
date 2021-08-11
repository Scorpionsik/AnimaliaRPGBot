class AnimaliaBot
	module Listener
		module View
			module AnimalView
				def get_name(animal)
					select_animal.name.nil? ? "*без имени*" : "\"#{select_animal.name}\""
				end
			
				def index
					select_animal = Listener.player.get_select_animal
					animal_view = "<u>#{select_animal.type_value} " + self.get_name(select_animal) + "</u>\n\n"
					animal_view += "<b>Класс:</b> в разработке"
					
					keyboard = nil
					filter_array = Listener.player.animals.filter {|animal| animal != select_animal}
					if filter_array.length == 0
						animal_view += "\n\nУ вас пока нету других зверей."
					else
						animal_view += "\n\nВы можете выбрать другого зверя."
						hash_array = filter_array.map {|animal| ["animal_#{animal.id}", "#{animal.type_value} #{name}"]}.to_h
						keyboard = InlineKeyboard.make_callback_data_kb_from(hash, 1)
					end
					[animal_view, keyboard]
				end
				module_function(
					:index,
					:get_name
				)
			end
		end
	end
end

#text: "#{animal.type_value} #{name}", callback_data: "animal_#{animal.id}"