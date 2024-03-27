class LanguagesController < ApplicationController
  before_action :set_language, only: [:destroy]

  def create
    @profile = current_user.profile
    @language = Language.new(params_language)
    @language.profile_id = @profile.id
    @language.save
    respond_to do |format|
      format.html { redirect_to profile_path }
      format.json
    end
  end

  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, notice: 'Language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_language
    @language = current_user.profile.languages.find(params[:id])
  end

  def params_language
    params.require(:language).permit(:title, :level)
  end
end
