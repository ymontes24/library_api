class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :checkout_date, presence: true

  scope :active, -> { where(returned: false) }
  scope :returned, -> { where(returned: true) }
end
