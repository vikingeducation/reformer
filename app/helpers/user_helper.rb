module UserHelper
	# Question: Is it ok to use view_context to call this from controller?
	# Seems a bit smelly but is the recommended answer in stackoverflow
	# http://stackoverflow.com/questions/5130150/rails-how-to-use-a-helper-inside-a-controller
	def fetch_user_param(param_name)
		params["user"].nil? ? params[param_name] : params["user"][param_name]
	end

end
