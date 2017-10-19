class UserDecorator < SimpleDelegator
  def full_name
    [first_name, last_name].join ' '
  end

  def signup_date
    created_at.strftime "%Y-%m-%d"
  end
end