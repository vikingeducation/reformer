module UsersHelper

  def form_errors(resource, field)
    unless resource.errors[field].empty?
      resource.errors[field].first
    end
  end
end
