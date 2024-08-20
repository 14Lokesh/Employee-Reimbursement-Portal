class Employee < ApplicationRecord
  belongs_to :company
  has_many :reimbursement_claims
end
