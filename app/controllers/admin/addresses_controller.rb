class Admin::AddressesController < ApplicationController
  layout 'admin_portal'

  def all
    addresses = Address.all
    render :index, locals: { addresses: addresses }
  end

  def index
    user = decorated_user
    render :user_addresses, locals: { user: user, addresses: user.addresses }
  end

  def new
    user = decorated_user
    address = Address.new
    address.build_city

    render :new, locals: { user: user, address: address }
  end

  def create
    user = decorated_user
    address = user.addresses.build address_params

    if user.save
      flash[:success] = 'Created address.'
      redirect_to admin_user_addresses_path(user)
    else
      flash[:danger] = "Couldn't create address for #{user.full_name}"
      render :new, locals: { user: user, address: address }
    end
  end

  def show
    user = decorated_user
    address = found_address
    render :show, locals: { user: user, address: address }
  end

  def edit
    user = decorated_user
    address = found_address

    render :edit, locals: { user: user, address: address}
  end

  def update
    user = decorated_user
    address = found_address

    if address.update_attributes address_params
      flash[:success] = 'Updated address.'
      redirect_to admin_user_address_path(user, address)
    else
      flash[:danger] = "Couldn't update address for #{user.full_name}"
      render :edit, locals: { user: user, address: address }
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :street_1, :street_2, :post_code, :plus_4,
      :state_id, city_attributes: :name
    )
  end

  def decorated_user
    UserDecorator.new(User.find(params[:user_id]))
  end

  def found_address
    Address.find params[:id]
  end

end
