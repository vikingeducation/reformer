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

  def update
    user = UserDecorator.new(User.find(params[:user_id]))
    cards = user.cards.map { |card| ::CardDecorator.new(card) }
    order = Order.find(params[:id])

    checkout_date = determine_checkout_date(order, params[:order][:status])

    if order.update_attributes(order_params.merge(checkout_date: checkout_date))
      flash[:success] = 'Updated order'
      redirect_to admin_user_order_path(user, order)
    else
      flash[:danger] = "Couldn't update order"
      render :edit, locals: { user: user, order: OrderDecorator.new(order),
                              credit_cards: cards }
    end
  end

  def add_products
    order = Order.find(params[:order_id])
  end

  def update_contents
  end

  private

  def determine_checkout_date(order, status)
    if status == 'placed'
      if order.placed?
        date = order.checkout_date
      else
        date = Time.zone.now
      end
    else
      date = nil
    end
    date
  end

  def order_params
    params.require(:order).permit [:billing_id, :shipping_id, :credit_card_id]
  end
end