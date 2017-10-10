class Category < ApplicationRecord
  def available_id
    id || 'N/A'
  end
end
