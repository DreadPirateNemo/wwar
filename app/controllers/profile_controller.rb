class ProfileController < ApplicationController
  allow_unauthenticated_access only: [:show]
  before_action :set_profile, only: [:show, :edit, :update]

  def edit
    @profile = Current.user
    @user = Current.user
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    end
  end

  def show
  end

  private

  def set_profile
    @profile = User.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :phone_number, :email_address)
  end

end