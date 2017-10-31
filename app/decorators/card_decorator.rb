class CardDecorator < SimpleDelegator
  def discreet_number
    'Ending in ' + last_four
  end

  def last_four
    number.reverse[0, 4]
  end
end