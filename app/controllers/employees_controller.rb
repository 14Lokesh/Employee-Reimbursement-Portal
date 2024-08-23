class EmployeesController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @employees  = Employee.ordered_by
  end
  def new
    @employee = Employee.new
    @companies = Company.all 
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to employees_path, flash: { notice: 'Emplyoee created successfully' }
    else  
      flash[:notice] = 'Something went wrong'
      @companies = Company.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path, notice: 'Employee was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path  , notice: 'Employee was successfully destroyed.'
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :company_id)
  end
end
