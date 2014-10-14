module UsersHelper

  def field_with_errors(object, field)

    #no errors if no errors!

    if object.errors[field].empty?
      error = ""
    else
      #create an error div around the message
      error = content_tag(:div, class: "error") do
        field.to_s.titleize + " " + object.errors[field].first
      end
    end

    #combine our normal input tag with the error message
    text_field_tag(field) + error
  end
end
