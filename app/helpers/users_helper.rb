module UsersHelper

	def field_of_errors(object, field)
		if object.errors[field].any?
			error = content_tag(:div, class: "error") do
				field.to_s.titleize + " " + onject.errors[field].first
			end
		else
			error = ""				
		end
		text_field_tag(field) + error
	end
end
