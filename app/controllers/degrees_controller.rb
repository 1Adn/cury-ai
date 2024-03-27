class DegreesController < ApplicationController
  def create
    @profile = current_user.profile
    @degree = Degree.new(params_degree)
    @degree.profile_id = @profile.id
    @degree.save

    respond_to do |format|
      format.html { redirect_to profile_path }
      format.json
    end

  end

  private

  def params_degree
    params.require(:degree).permit(:title, :level, :field, :school)
  end
end
