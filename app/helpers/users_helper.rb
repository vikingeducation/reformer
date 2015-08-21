module UsersHelper

  def get_errors(sym, resource)
    return "#{sym.capitalize} #{resource.errors[sym][0]}" if resource.errors[sym]
  end
end
