class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
    @companies = Company.all 
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to new_session_path, flash: { notice: 'Emplyoee created successfully' }
    else  
      flash[:notice] = 'Something went wrong'
      @companies = Company.all
      render :new
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :company_id)
  end
end
