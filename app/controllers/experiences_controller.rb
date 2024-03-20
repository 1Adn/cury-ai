class ExperiencesController < ApplicationController
  def create
    @profile = Profile.last
    @experience = Experience.new(params_experience)
    @experience.profile_id = @profile.id
    @exprience.save!
  end

  private

  def params_exeperience
    params.require(:experience).require(:title, :type, :field,
       :starting_date, :ending_date, :description)
  end
end
