module UsersHelper
  def user_params
    if params[:user]
      params.require(:user).permit(:username, :email, :password)
    else
      { email: params[:email],
        password: params[:password],
        username: params[:username] }
    end
  end

  def form_field_error_message(resource, field_sym)
    unless resource.errors[field_sym].empty?
      content_tag(:span, class: 'error-message') do
        "#{field_sym.to_s.titleize} #{resource.errors[field_sym].first}"
      end
    end
  end
end
