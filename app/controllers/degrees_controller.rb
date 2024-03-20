class DegreesController < ApplicationController
  def create
    @profile = current_user.profile
    @degree = Degree.new(params_degree)
    @degree.profile_id = @profile.id
    @degree.save!
  end

  private

  def params_degree
    params.require(:degree).permit(:title, :level, :field, :school)
  end
end
