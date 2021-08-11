class AnimaliaBot
	module Listener
		module Mode
			def show_view(view)
				view.last.nil? ? Listener::Response.std_message(view.first) : Listener::Response.inline_message(view.first, view.last)
			end
			
			def update_view(message, view)
				view.last.nil? ? Listener::Response.edit_std_message(view.first, message) : Listener::Response.edit_inline_message(view.first, view.last, message)
			end
			module_function(
				:show_view,
				:update_view
			)
		end
	end
end