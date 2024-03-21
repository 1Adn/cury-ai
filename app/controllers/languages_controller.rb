class LanguagesController < ApplicationController
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

  private

  def params_language
    params.require(:language).permit(:title, :level)
  end
end
