class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(session_params[:username],
      session_params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def destroy
    logout(current_user)
    redirect_to new_session_url
  end

  def new
  end



  private
  def session_params
    params.require(:user).permit(:username, :password)
  end

end
