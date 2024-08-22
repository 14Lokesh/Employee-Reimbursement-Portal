class ReimbursementClaim < ApplicationRecord
  belongs_to :employee
  has_one_attached :receipt

  validates :purpose, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date_of_expenditure, presence: true
  validates :employee_id, presence: true
  # validates :receipt, content_type: { in: ['image/png', 'image/jpeg', 'image/jpg'],
  # message: 'must be a PNG, JPG, or JPEG image' }
  scope :ordered_by, -> { order(created_at: :desc) }

end
