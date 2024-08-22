class ReimbursementClaimsController < ApplicationController
  def new
    @reimbursement_claim = ReimbursementClaim.new
    @employees = Employee.all
  end

  def create
    @reimbursement_claim = ReimbursementClaim.new(reimbursement_claim_params)
    if @reimbursement_claim.save
      company = @reimbursement_claim.employee.company
      company.update(total_reimbursement: company.total_reimbursement + @reimbursement_claim.amount)
      redirect_to @reimbursement_claim, notice: 'Reimbursement claim was successfully created.'
    else
      @employees = Employee.all
      render :new
    end
  end

  private

  def reimbursement_claim_params
    params.require(:reimbursement_claim).permit(:purpose, :amount, :date_of_expenditure, :employee_id)
  end
end
