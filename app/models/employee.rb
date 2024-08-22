class Employee < ApplicationRecord
  
  belongs_to :company
  has_many :reimbursement_claims, dependent: :destroy

  validates :name, presence: true
  validates :company_id, presence: true

  scope :ordered_by, -> { order(created_at: :desc) }

end
