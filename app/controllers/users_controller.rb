class UsersController < ApplicationController
  before_action :current_user?

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      session[:user_email] = user.email
      UserMailer.new_user(user).deliver_now
      UserMailer.new_user_notification(user).deliver_now
      redirect_to '/'
    else
      flash[:errors] = user.errors.full_messages
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
