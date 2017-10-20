class Admin::AddressesController < ApplicationController
  layout 'admin_portal'

  def all
    addresses = Address.all
    render :index, locals: { addresses: addresses }
  end

  def index
    user = UserDecorator.new(User.find(params[:user_id]))
    render :user_addresses, locals: { user: user, addresses: user.addresses }
  end

  def new
    user = UserDecorator.new(User.find(params[:user_id]))
    address = Address.new
    address.build_city

    render :new, locals: { user: user, address: address }
  end

  def create
    user = UserDecorator.new(User.find(params[:user_id]))
    address = user.addresses.build address_params

    if user.save
      flash[:success] = 'Created address.'
      redirect_to admin_user_addresses_path(user)
    else
      flash[:danger] = "Couldn't create address for #{user.full_name}"
      render :new, locals: { user: user, address: address }
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :street_1, :street_2, :post_code, :plus_4,
      :state_id, city_attributes: :name
    )
  end
end
