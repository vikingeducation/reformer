module ApplicationHelper

  def show_field_errors(object, field)
    unless object.errors.empty?
      object.errors[field].first
    end
  end
end
