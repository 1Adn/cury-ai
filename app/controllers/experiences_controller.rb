class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:destroy]

  def create
    @profile = current_user.profile
    @experience = Experience.new(params_experience)
    @experience.profile_id = @profile.id
    @experience.save
    respond_to do |format|
      format.html { redirect_to profile_path }
      format.json
    end
  end

  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_experience
    @experience = current_user.profile.experiences.find(params[:id])
  end

  def params_experience
    params.require(:experience).permit(:title, :experience_type, :field, :starting_date, :ending_date, :description)
  end
end
