module UsersHelper

  def field_with_errors(object, field)
    if object.errors[field].empty?
      error = ""
    else
      error = content_tag(:p, class: "error") do
        field.to_s.titleize + " " + object.errors[field].first
      end
    end
    # text_field_tag(field) + error
  end

end
