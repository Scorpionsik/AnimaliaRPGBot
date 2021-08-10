module Schema
	attr_accessor :db
	
	require 'sqlite3'
	
	module Create
		def animals
			Schema.db.execute <<-SQL
				CREATE TABLE IF NOT EXISTS animals(
					id INTEGER PRIMARY KEY AUTOINCREMENT, 
					name TEXT,
					type TEXT,
					village_id INTEGER NOT NULL,
					player_id INTEGER NOT NULL,
					created_at datetime(6),
					updated_at datetime(6),
					CONSTRAINT fk_players FOREIGN KEY (player_id)
					REFERENCES players (id),
					CONSTRAINT fk_villages FOREIGN KEY (village_id)
					REFERENCES villages (id) 
					);
			SQL
			true
		rescue SQLite3::SQLException
			false
		end
		
		def villages
			Schema.db.execute <<-SQL
			CREATE TABLE IF NOT EXISTS villages(
				id INTEGER PRIMARY KEY AUTOINCREMENT,
				telegram_chat INTEGER NOT NULL,
				name TEXT,
				created_at datetime(6),
				updated_at datetime(6)
			);
			SQL
			true
		rescue SQLite3::SQLException
			false
		end
		
		def players
			Schema.db.execute <<-SQL
			CREATE TABLE IF NOT EXISTS players(
				id INTEGER PRIMARY KEY AUTOINCREMENT, 
				telegram_chat INTEGER NOT NULL,
				village_id INTEGER,
				first_name TEXT,
				last_name TEXT,
				mode TEXT,
				select_animal INTEGER,
				created_at datetime(6),
				updated_at datetime(6),
				CONSTRAINT fk_villages FOREIGN KEY (village_id)
					REFERENCES villages (id) 
					);
			);
			SQL
			true
		rescue SQLite3::SQLException
			false
		end
		
		def rpg_classes
			Schema.db.execute <<-SQL
			CREATE TABLE IF NOT EXISTS rpg_classes(
				id INTEGER PRIMARY KEY AUTOINCREMENT,
				type TEXT,
				level INTEGER NOT NULL DEFAULT 1,
				animal_id INTEGER NOT NULL,
				created_at datetime(6),
				updated_at datetime(6),
				CONSTRAINT fk_animals FOREIGN KEY (animal_id)
				REFERENCES animals (id) 
			);
			SQL
			true
		rescue SQLite3::SQLException
			false
		end

		module_function(
			:players,
			:animals,
			:rpg_classes,
			:villages
		)
	end
	
	def setup
		self.db = SQLite3::Database.open 'db/bot.db'
		Create.villages unless get_table('villages')
		Create.players unless get_table('players')
		Create.animals unless get_table('animals')
		Create.rpg_classes unless get_table('rpg_classes')
	end
	
	def get_table(table_name)
		db.execute <<-SQL
			Select * from #{table_name}
		SQL
	rescue SQLite3::SQLException
		false
	end
	
	module_function(
		:get_table,
		:setup,
		:db,
		:db=
	)
end



#db = SQLite3::Database.open 'db/bot.db'

#db.execute <<-SQL
# CREATE TABLE IF NOT EXISTS animals(
#	id INTEGER PRIMARY KEY AUTOINCREMENT, 
#	name TEXT,
#	type TEXT
#	);
#	SQL

#db.execute <<-SQL
#CREATE TABLE IF NOT EXISTS weapons(
#	id INTEGER PRIMARY KEY AUTOINCREMENT, 
#	name TEXT,
#	damage_value INTEGER,
#	animal_id INTEGER NOT NULL,
#	CONSTRAINT fk_animals FOREIGN KEY (
#	animal_id
#	)
#	REFERENCES animals (id) 
#	);
#SQL

