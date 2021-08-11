class AnimaliaBot
	module Listener
		module Mode
			def show_view(view)
				view.last.nil? ? Listener::Response.std_message(view.first) : Listener::Response.inline_message(view.first, view.last)
			end
			module_function(
				:show_view
			)
		end
	end
end