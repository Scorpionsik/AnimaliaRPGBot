require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/bot.db')
#chat entity
class Village < ActiveRecord::Base
	has_many :players
	has_many :animals
end