module UsersHelper

  def error_field(object, field)
    if object.errors[field].empty?
      error = ""
    else
      error = content_tag(:div, class: "error") do
        "your " + field.to_s.titleize + " " + object.errors[field].first
      end
    end
    error
  end

end
