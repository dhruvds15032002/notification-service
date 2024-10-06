class Recipient < ApplicationRecord
  has_many :notifications

  # Add necessary validations here
  validates :email, presence: true, if: -> { phone.blank? }
  validates :phone, presence: true, if: -> { email.blank? }
end
