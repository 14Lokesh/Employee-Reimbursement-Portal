class Company < ApplicationRecord
  has_many :employees, dependent: :destroy

  scope :ordered_by, -> { order(created_at: :desc) }

  validates :name, :employee_count, :total_reimbursement, presence: true 
  validates :employee_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total_reimbursement, numericality: { greater_than_or_equal_to: 0 }
end
