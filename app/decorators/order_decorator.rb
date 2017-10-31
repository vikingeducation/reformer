class OrderDecorator < SimpleDelegator
  def date_placed
    if placed?
      checkout_date.to_date
    else
      'N/A'
    end
  end

  def heading_text
    placed? ? "Order #{id}" : 'Shopping cart'
  end

  def status_css
    placed? ? 'order-placed' : 'order-unplaced'
  end

  def status_text
    placed? ? 'placed' : 'unplaced'
  end
end