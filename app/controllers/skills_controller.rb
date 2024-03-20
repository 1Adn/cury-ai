class SkillsController < ApplicationController
  def create
    @profile = Profile.last
    @skill = Skill.new(params_skill)
    @skill.profile_id = @profile.id
    @skill.save!
  end

  private

  def params_skill
    params.require(:skill).permit(:title, :level)
  end
end
