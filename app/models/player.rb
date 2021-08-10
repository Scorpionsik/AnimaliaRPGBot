require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/bot.db')

class Player < ActiveRecord::Base
	has_many :villages
	has_many :animals
	
	def get_select_animal
		animals.find_by(id: self.select_animal, player_id: self.id, village_id: self.village_id)
	end
end