class OrderDecorator < SimpleDelegator
  def date_placed
    if placed?
      checkout_date
    else
      'N/A'
    end
  end
end