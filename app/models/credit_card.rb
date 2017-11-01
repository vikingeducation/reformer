class CreditCard < ApplicationRecord
  belongs_to :user

  validates :number, presence: true,
            length: { is: 16 },
            numericality: :only_integer

  validates :expires, presence: true

  validates :cv2, length: { is: 3 }
end
