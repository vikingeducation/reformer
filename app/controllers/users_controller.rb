class UsersController < ApplicationController
  before_action :nested_or_flat, only: [:create]


  def new
    @user = User.new
  end


  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      flash[:success] = "User '#{@user.username}' successfully created!"
      redirect_to new_user_path
    else
      flash.now[:error] = "Unable to create '#{@user.username}'"
      render :new
    end
  end






  def whitelisted_user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def nested_or_flat
    unless params[:user]
      params[:user] = {email: params[:email], username: params[:username], password: params[:password]}
    end
  end


#   flat
#     Parameters: {"utf8"=>"✓", "authenticity_token"=>"ElYux4YpBrp0r50aTYDpEkCl+8m4oKftacEOur+pbTVfhwK03ALtn1ReTjQiWOzohxL5Z07lX1O2oDHCfwunBg==", "email"=>"e", "username"=>"e@email.com", "password"=>"[FILTERED]", "commit"=>"Submit"}
# Completed 400 Bad Request in 1ms (ActiveRecord: 0.0ms)


# nested

# Parameters: {"utf8"=>"✓", "authenticity_token"=>"ElYux4YpBrp0r50aTYDpEkCl+8m4oKftacEOur+pbTVfhwK03ALtn1ReTjQiWOzohxL5Z07lX1O2oDHCfwunBg==", "user"=>{"email"=>"e", "username"=>"e", "password"=>"[FILTERED]"}}


end
