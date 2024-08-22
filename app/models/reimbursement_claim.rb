class ReimbursementClaim < ApplicationRecord
  belongs_to :employee

  validates :purpose, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date_of_expenditure, presence: true
  validates :employee_id, presence: true

  scope :ordered_by, -> { order(created_at: :desc) }

end
