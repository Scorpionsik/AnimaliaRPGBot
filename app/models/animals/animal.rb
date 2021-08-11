require 'active_record'
require './app/enums/attribute_param'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/bot.db')

class Animal < ActiveRecord::Base
	belongs_to :village
	belongs_to :player
	has_one :rpg_class
	has_one :rpg_attribute
	
	def initialize
		Listener::AnimalFactory.roll_attributes_from self if self.rpg_attribute.nil?
	end
	
	def self.type_value
		""
	end
	
	def type_value
		self.class.type_value
	end
	
	def pet
		"#{self.class.type_value} ластится и тянется к вашей ласковой руке!"
	end
	
	def get_attribute_params
		{
		strength: AttributeParam::RANDOM,
		dexterity: AttributeParam::RANDOM,
		constitution: AttributeParam::RANDOM,
		intelligence: AttributeParam::RANDOM,
		charisma: AttributeParam::RANDOM,
		luck: AttributeParam::RANDOM
		}
	end
end