
class SubsController < ApplicationController

  def index
  end

  def create
    new_sub = Sub.new(sub_params)
    new_sub.mod_id = current_user.id
    if new_sub.save
      redirect_to sub_url(new_sub)
    else
      flash[:errors] = sub_new.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def new
    if current_user
      render :new
    else
      redirect_to new_session_url
    end
  end

  def edit
    @potential_subs = Sub.find(params[:id])
    user_id = current_user.id
    if @potential_subs && @potential_subs.is_moderator?(user_id)
      render :edit
    else
      redirect_to subs_url
    end
  end

  def show
  end

  def update
    sub_update = Sub.find(params[:id])
    sub_update.update(sub_params)

  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
