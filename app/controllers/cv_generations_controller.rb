class CvGenerationsController < ApplicationController
  def new
    # loading screen
    @cvgeneration = CvGeneration.new
    @job_offer = current_user.job_offers.last
  end

  def create
    @cvgeneration = CvGeneration.new
    @profile = current_user.profile
    @job_offer = current_user.job_offers.last
    @cvgeneration.profile = @profile
    @cvgeneration.job_offer = @job_offer
    @cvgeneration.save!
    redirect_to cv_generation_path(@cvgeneration)
  end

  def show
    @cvgeneration = CvGeneration.find(params[:id])
    @cv = Cv.new
    @cv.user = current_user
    @cv.cv_generation = @cvgeneration
    @cv.save!
  end
end
