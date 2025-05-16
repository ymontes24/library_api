class Book < ApplicationRecord
  belongs_to :author
  has_many :loans, dependent: :destroy

  validates :title, presence: true
  validates :isbn, uniqueness: true, allow_blank: true
end
