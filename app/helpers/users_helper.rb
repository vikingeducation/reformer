module UsersHelper

  def nest_flat_tags
    params[:user] = {}
    params[:user][:username] = params[:username] if params[:username]
    params[:user][:email] = params[:email] if params[:email]
    params[:user][:password] = params[:password] if params[:password]
  end

end
