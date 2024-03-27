class DegreesController < ApplicationController

  before_action :set_degree, only: [:destroy]

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

  def destroy
    @degree.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, notice: 'Degree was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_degree
    @degree = Degree.find(params[:id])
  end
  
  def params_degree
    params.require(:degree).permit(:title, :level, :field, :school)
  end
end
