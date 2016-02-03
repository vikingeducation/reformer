module UsersHelper


  # def field_with_errors(object,field)
  #   if object.errors[field].empty?
  #     error = ""
  #   else
  #     error = content_tag(:div, :class=>"error") do
  #       field.to_s.titleize + " " + object.errors[field].first
  #     end
  #   end
  #   text_field_tag(field) + error
  # end


  def field_with_errors(object, field)
    unless object.errors[field].empty?
      content_tag(:div, class: "error") do
        "#{field.to_s.titleize} #{object.errors[field].first}"
      end
    end
  end

end
