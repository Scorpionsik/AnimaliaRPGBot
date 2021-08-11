require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/bot.db')

class Animal < ActiveRecord::Base
	belongs_to :village
	belongs_to :player
	has_one :rpg_class
	
	def self.type_value
		""
	end
	
	def type_value
		self.class.type_value
	end
	
	def pet
		"#{self.class.type_value} ластится и тянется к вашей ласковой руке!"
	end
end