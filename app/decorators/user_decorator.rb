class UserDecorator < SimpleDelegator
  def full_name
    [first_name, last_name].join ' '
  end

  def signup_date
    created_at.strftime "%Y-%m-%d"
  end

  def show_billing_address
    if billing_address.present?
      AddressDecorator.new(billing_address).full_address
    else
      'None assigned.'
    end
  end

  def show_shipping_address
    if shipping_address.present?
      AddressDecorator.new(shipping_address).full_address
    else
      'None assigned.'
    end
  end
end