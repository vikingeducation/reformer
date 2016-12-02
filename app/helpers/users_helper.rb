module UsersHelper

  def error_tag(field)
    if @user.errors[field]
      content_tag(:span, class: "error") do
        "#{@user.errors[field].first}"
      end
    end
  end

end
