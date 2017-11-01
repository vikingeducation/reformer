module OrdersHelper
  def order_form_button_label
    if params[:action] == 'new'
      'Create order in shopping cart'
    else
      'Update order information'
    end
  end
end