module UsersHelper
  def field_with_errors(object,field)

    if object.errors[field].empty?
      #error = "" #no error messages
    else
      error = content_tag(:div, :class=>"error") do
        field.to_s.titleize + " " + object.errors[field].first #create a new error messages
      end
    end
  end
end
