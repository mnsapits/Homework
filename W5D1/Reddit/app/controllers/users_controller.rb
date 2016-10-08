class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:username] = params[:user][:username]
       flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def show

    if current_user && current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render :show
    else
      redirect_to new_session_url
    end
  end

  def new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
