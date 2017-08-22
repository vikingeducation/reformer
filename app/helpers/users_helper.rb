module UsersHelper
  def field_with_errors(object, field)
    if object.errors[field].empty?
      error = ""
    else
      error = field.to_s.capitalize + " " + object.errors[field].first
      content_tag(:span, error, class: "error-message")
    end
  end
end
