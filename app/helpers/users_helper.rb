module UsersHelper

	def user_params
  	params.permit(:username, :email, :password)
  end
end
