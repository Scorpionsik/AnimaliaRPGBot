require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/bot.db')

class Player < ActiveRecord::Base
	belongs_to :village
	has_many :animals
	
	def get_select_animal
		self.animals.find_by(id: self.select_animal)
	end
end