module UsersHelper

	def field_with_errors(object, field_sym)
		unless object.errors[field_sym].empty?
			"#{field_sym.to_s.titleize} #{object.errors[field_sym].first}"
		end
	end
end
