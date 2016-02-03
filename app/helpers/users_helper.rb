module UsersHelper

  def display_error_message(resource, field)
    unless resource.errors[field].empty?
      content_tag(:span) do
         "#{field.to_s.titleize} #{resource.errors[field].first}"
      end
    end
  end

end


