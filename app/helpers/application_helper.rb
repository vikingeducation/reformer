module ApplicationHelper
  def field_with_errors(resource, field)
    return if resource.errors[field].empty?

    message = resource.errors[field].first
    tag.span "#{field.to_s.capitalize} #{message}", class: :error_message
  end
end
