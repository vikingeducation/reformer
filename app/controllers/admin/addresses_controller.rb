class Admin::AddressesController < ApplicationController
  layout 'admin_portal'

  def new
    @user = User.find params[:user_id]
    @address = Address.new
  end

  def create
    @address = Address.new address_params
    @address.city = City.find_or_create_by name: params[:city]

    if @address.save
      flash[:success] = 'Created address.'
    end
  end

  private

  def address_params
    params.permit :city

    params.require(:address).permit(
      %i[street_1 street_2 post_code plus_4 state_id]
    )
  end
end
