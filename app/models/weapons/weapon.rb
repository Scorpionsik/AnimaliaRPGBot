require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/bot.db')

class Weapon < ActiveRecord::Base
	belongs_to :animal
	
end