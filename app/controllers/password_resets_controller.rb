class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]  
  
  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user 
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions."
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found."  # .now bo później renderujemy.
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if params[:user][:password].empty?                  # Case (3)
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      flash[:success] = "Password has been reset."
      log_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
    def get_user
      @user = User.find_by(email: params[:email])
    end
  
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end
