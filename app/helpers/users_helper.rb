module UsersHelper
  def field_error_message(user, sym)
    unless user.errors[sym].empty?
      content_tag(:li, class: "error-message") do
         sym.to_s.titleize + " " + user.errors[sym].first
      end
    end
  end

end
