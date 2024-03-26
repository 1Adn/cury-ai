class ProfilesController < ApplicationController
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

  private

  def params_profile
    params.require(:profile).permit(:first_name, :last_name, :address, :age, :phone_number, :email, :photo)
  end
end
