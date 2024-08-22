class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), flash: { notice: 'Logged In Successfully' }
    else  
      flash[:notice] = 'Invalid Email or Password'
      render :new
    end
  end

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, flash: { notice: 'Logged in successfully' }
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash: { notice: 'Log Out Successfully' }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end