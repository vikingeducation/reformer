module UsersHelper

  def form_field_error_message(resource, field)
    unless resource.errors[field].empty?
      error = content_tag(:div) do
        resource.errors[field].first
      end
    end  
  end


end
