module UsersHelper

  def parse_params(passed_params)
    if params[user].exists?
      params.require(:user).permit(:username, :email, :password)
    else
      params.permit(:username, :email, :password)
    end
  end

end

=begin
Parameters: {"utf8"=>"✓",
"authenticity_token"=>"TyBzfHftylyOBYdMQp33X1Qy3p19fxXvepkFwJM/9iJPiX6Yj27tVqsB/R4uvgOngW8CNk223JXM0aOKB6pNXg==",
"username"=>"fdds",
"email"=>"dsfsdf",
"password"=>"[FILTERED]", "commit"=>"Save changes"}
=end