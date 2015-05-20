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
end
