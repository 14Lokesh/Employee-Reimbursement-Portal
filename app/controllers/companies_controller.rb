class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      @company.save
      redirect_to new_session_path, flash: { notice: 'Company created successfully' }
    else  
      flash[:notice] = 'Something went wrong'
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :employee_count, :total_reimbursement)
  end
end
