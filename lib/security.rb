class AnimaliaBot
	module Listener
		module Security
			def max_minutes_delay
				5
			end
		
			def message_is_new(start_time, message)
				message_time = (defined? message.date) ? message.date : message.message.date
				message_time.to_i > start_time
			end
			
			def message_too_far
				message_date = (defined? Listener.message.date) ? Listener.message.date : Listener.message.message.date
				message_delay = Time.now.to_i - message_date.to_i
				message_delay > (self.max_minutes_delay * 60)
			end
			
			module_function(
				:message_is_new,
				:message_too_far,
				:max_minutes_delay
			)
		end
	end
end