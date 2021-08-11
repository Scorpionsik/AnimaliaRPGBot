class AnimaliaBot
	module Listener
		module View
			module AnimalView
				def get_name(animal)
					animal.name.nil? ? "*без имени*" : "\"#{animal.name}\""
				end
			
				def index
					select_animal = Listener.player.get_select_animal
					animal_view = "<u>#{select_animal.type_value} " + self.get_name(select_animal) + "</u>\n\n"
					
					animal_view += "<b>Класс:</b> в разработке\n"
					
					animal_view +="\n<b>Сила: </b> #{select_animal.rpg_attribute.strength}\n" + 
					"<b>Ловкость: </b> #{select_animal.rpg_attribute.dexterity}\n" +
					"<b>Выносливость: </b> #{select_animal.rpg_attribute.constitution}\n" +
					"<b>Интеллект: </b> #{select_animal.rpg_attribute.intelligence}\n" +
					"<b>Харизма: </b> #{select_animal.rpg_attribute.charisma}\n" +
					"<b>Удача: </b> #{select_animal.rpg_attribute.luck}\n"
					
					keyboard = nil
					filter_array = Listener.player.animals.filter {|animal| animal != select_animal}
					puts "-=-= Start check animal button =-=-"
					p filter_array
					if filter_array.length == 0
						animal_view += "\n\nУ вас пока нету других зверей."
					else
						animal_view += "\n\nВы можете выбрать другого зверя."
						hash_array = filter_array.map {|animal| ["animal_#{animal.id}", "#{animal.type_value} #{animal.name}"]}.to_h
						p hash_array
						keyboard = InlineKeyboard.make_callback_data_kb_from(hash_array, 1)
						p keyboard
					end
					puts "-=-= End check animal button =-=-"
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