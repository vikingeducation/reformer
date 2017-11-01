class AddressDecorator < SimpleDelegator
  def full_address
    "#{street_1} #{street_2}, #{city.name}, #{state.abbrev} #{post_code}"
  end
end