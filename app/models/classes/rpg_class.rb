require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/bot.db')

class RpgClass < ActiveRecord::Base
	belongs_to :animal
	
	def class_value
		""
	end
end