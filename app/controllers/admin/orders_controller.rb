class Admin::OrdersController < ApplicationController
  layout 'admin_portal'

  def new
    user = UserDecorator.new(User.find(params[:user_id]))
    cards = user.cards.map { |card| ::CardDecorator.new(card) }

    render :new, locals: { user: user, credit_cards: cards, order: OrderDecorator.new(Order.new) }
  end

  def create
    user = UserDecorator.new(User.find(params[:user_id]))
    cards = user.cards.map { |card| ::CardDecorator.new(card) }
    order = user.orders.build order_params

    if order.save
      flash[:success] = "Created order for #{user.full_name}"
      redirect_to edit_admin_user_order_path(user, order)
    else
      flash[:danger] = "Couldn't create order"
      render :new, locals: { user: user, credit_cards: cards, order: order }
    end
  end

  def edit
    user = UserDecorator.new(User.find(params[:user_id]))
    cards = user.cards.map { |card| ::CardDecorator.new(card) }
    order = OrderDecorator.new(Order.find(params[:id]))

    render :edit, locals: { user: user, credit_cards: cards, order: order }
  end

  def add_products
    order = Order.find(params[:order_id])
  end

  def update_contents
  end

  private

  def order_params
    params.require(:order).permit [:billing_id, :shipping_id, :credit_card_id]
  end
end