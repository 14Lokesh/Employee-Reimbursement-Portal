class CompaniesController < ApplicationController

  def index
    @companies = Company.ordered_by
  end
  
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      @company.save
      redirect_to companies_path, flash: { notice: 'Company created successfully' }
    else  
      flash[:notice] = 'Something went wrong'
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to companies_path, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path, notice: 'Company was successfully destroyed.'
  end

  private

  def company_params
    params.require(:company).permit(:name, :employee_count, :total_reimbursement)
  end
end
