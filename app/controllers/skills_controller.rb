class SkillsController < ApplicationController
  before_action :set_skill, only: [:destroy]

  def create
    @profile = current_user.profile
    @skill = Skill.new(params_skill)
    @skill.profile_id = @profile.id
    @skill.save
    respond_to do |format|
      format.html { redirect_to profile_path }
      format.json
    end
  end

  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, notice: 'Skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_skill
    @skill = current_user.profile.skills.find(params[:id])
  end
  
  def params_skill
    params.require(:skill).permit(:title, :level)
  end
end
