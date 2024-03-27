class ProfilesController < ApplicationController

  before_action :set_profile, only: [:edit, :update]

  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(params_profile)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to @profile
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @profile = @user.profile
    @degree = Degree.new
    @language = Language.new
    @skill = Skill.new
    @experience = Experience.new
    @job_offer = JobOffer.new
  end

  def edit
  end

  def update
    if @profile.update(params_profile)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def params_profile
    params.require(:profile).permit(:first_name, :last_name, :address, :age, :phone_number, :email, :photo)
  end
end
