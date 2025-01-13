class UsersController < ApplicationController
  before_action :set_user

  def edit
    render 'profile/edit'
  end

  def update
    if @user.update(user_params)
      redirect_to edit_profile_path, notice: 'Profile updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def set_user
    @user = Current.user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email_address, :phone_number, :password, :password_confirmation)
  end

end