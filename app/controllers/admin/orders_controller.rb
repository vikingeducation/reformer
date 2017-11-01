class Admin::OrdersController < ApplicationController
  layout 'admin_portal'

  def all
    orders = Order.limit(50).map { |order| OrderDecorator.new(order) }
    render :index, locals: { orders: orders }
  end

  def index
    user = decorated_user
    orders = user.orders.take(50).map { |o| OrderDecorator.new(o) }

    render :user_orders, locals: { user: user, orders: orders }
  end

  def new
    user = decorated_user
    cards = decorated_cards(user)

    render :new, locals: { user: user, credit_cards: cards, order: OrderDecorator.new(Order.new) }
  end

  def create
    user = decorated_user
    cards = decorated_cards(user)
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
    user = decorated_user
    cards = decorated_cards(user)
    order = decorated_order

    render :edit, locals: { user: user, credit_cards: cards, order: order }
  end

  def update
    user = decorated_user
    cards = decorated_cards(user)
    order = OrderDecorator.new(Order.find(params[:id]))

    checkout_date = determine_checkout_date(order)

    new_order_params = order_params
    if new_order_params[:contents_attributes].present?
      new_order_params[:contents_attributes].each do |index, content|
        if content[:quantity] == '0'
          content[:_destroy] = '1'
        end
      end
    end

    if order.update_attributes(new_order_params.merge(checkout_date: checkout_date))
      flash[:success] = 'Updated order'
      redirect_to admin_user_order_path(user, order)
    else
      flash[:danger] = "Couldn't update order"
      render :edit, locals: { user: user, order: order,
                              credit_cards: cards }
    end
  end

  def show
    user = decorated_user
    order = decorated_order

    render :show, locals: { user: user, order: order }
  end

  def destroy
    if Order.find(params[:id]).destroy
      flash[:success] = 'Order deleted'
      redirect_to admin_user_path(params[:user_id])
    else
      flash[:danger] = "Couldn't delete order"
      redirect_to :back
    end
  end

  def add_products
    order = Order.find(params[:order_id])
    user = decorated_user

    product_ids = params[:product_ids]
    quantities = params[:product_quantities]
    products_to_add = []

    product_ids.each_with_index do |id, i|
      quantity = quantities[i].to_i
      next if id.blank? || quantity < 0

      found = products_to_add.detect { |prod| prod[:product_id] == id }
      if found
        found[:quantity] += quantity
      else
        products_to_add << { product_id: id, quantity: quantity }
      end
    end

    order.contents.build products_to_add
    if order.save
      flash[:success] = 'Added products to order'
      redirect_to admin_user_order_path(user, order)
    else
      flash[:danger] = "Couldn't add products"
      cards = decorated_cards(user)
      render :edit, locals: { user: user, credit_cards: cards, order: OrderDecorator.new(order) }
    end
  end

  private

  def decorated_cards(user)
    user.cards.map { |card| CardDecorator.new(card) }
  end

  def decorated_order
    OrderDecorator.new(Order.find(params[:id]))
  end

  def decorated_user
    UserDecorator.new(User.find(params[:user_id]))
  end

  def determine_checkout_date(order)
    status = order_status[:status]
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
    params
      .require(:order)
      .permit(
        :billing_id, :shipping_id, :credit_card_id,
        { contents_attributes:
            [:id, :quantity, :_destroy, :order_id, :product_id]
        }
      )
  end

  def order_status
    params.require(:order).permit :status
  end
end