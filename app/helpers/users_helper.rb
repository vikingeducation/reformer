module UsersHelper

  def display_user_errors(resource, field_sym)
     unless resource.errors[field_sym].empty?
      content_tag(:span, class: "error-msg") do
         "#{field_sym.to_s.titleize} #{resource.errors[field_sym].first}"
       end
     end
  end


end
