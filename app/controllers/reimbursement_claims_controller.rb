class ReimbursementClaimsController < ApplicationController
  def index
    @reimbursement_claims = ReimbursementClaim.ordered_by
  end

  def new
    @reimbursement_claim = ReimbursementClaim.new
    @employees = Employee.all
  end

  def create
    @reimbursement_claim = ReimbursementClaim.new(reimbursement_claim_params)
    if @reimbursement_claim.save
      company = @reimbursement_claim.employee.company
      company.update(total_reimbursement: company.total_reimbursement + @reimbursement_claim.amount)
      redirect_to reimbursement_claims_path, notice: 'Reimbursement claim was successfully created.'
    else
      @employees = Employee.all
      render :new
    end
  end

  def edit
    @reimbursement_claim = ReimbursementClaim.find(params[:id])
  end

  def update
    @reimbursement_claim = ReimbursementClaim.find(params[:id])
    if @reimbursement_claim.update(reimbursement_claim_params)
      redirect_to reimbursement_claims_path, notice: 'Claim was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reimbursement_claim = ReimbursementClaim.find(params[:id])
    @reimbursement_claim.destroy
    redirect_to reimbursement_claims_path, notice: 'Claim was successfully destroyed.'
  end

  private

  def reimbursement_claim_params
    params.require(:reimbursement_claim).permit(:purpose, :amount, :date_of_expenditure, :employee_id)
  end
end
