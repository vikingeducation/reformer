module UsersHelper

	def user_params( user )
  	params.require(:user).permit(:username, :email, :password)
  end
end
