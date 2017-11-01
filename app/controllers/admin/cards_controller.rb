class Admin::CardsController < ApplicationController
  def destroy
    card = CreditCard.find(params[:id])
    user = User.find(params[:user_id])

    if card.destroy
      flash[:success] = "Deleted redit card for user #{user.first_name} #{user.last_name}"
      redirect_to admin_user_path(user)
    else
      flash[:danger] = "Couldn't delete credit card"
      redirect_to :back
    end
  end
end