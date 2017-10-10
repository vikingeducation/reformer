class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 4..16 }

  def available_id
    id || 'N/A'
  end
end
