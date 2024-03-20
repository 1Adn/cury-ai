class ExperiencesController < ApplicationController
  def create
    @profile = current_user.profile
    @experience = Experience.new(params_experience)
    @experience.profile_id = @profile.id
    @experience.save!
  end

  private

  def params_experience
    params.require(:experience).permit(:title, :experience_type, :field, :starting_date, :ending_date, :description)
  end
end
