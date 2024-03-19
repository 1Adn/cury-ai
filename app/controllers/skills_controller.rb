class SkillsController < ApplicationController
  def create
    @skill.profile_id = @profile.id
  end
end
