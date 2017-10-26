class CardDecorator < SimpleDelegator
  def discreet_number
    'Ending in ' + number.reverse[0, 4]
  end
end