class CvGenerationsController < ApplicationController
  def new
    # loading screen
    @cvgeneration = CvGeneration.new
    @job_offer = current_user.job_offers.last
  end

  def create
    @cvgeneration = CvGeneration.new
    @profile = current_user.profile
    @job_offer = JobOffer.find(params[:job_offer_id])
    @cvgeneration.profile = @profile
    @cvgeneration.job_offer = @job_offer
    if @cvgeneration.save!
      GenerateCvJob.perform_later(@cvgeneration)
      redirect_to cv_generation_path(@cvgeneration)
    else
    redirect_to job_offer_path(@cvgeneration)
    end
  end

  def show
    @cvgeneration = CvGeneration.find(params[:id])
    @cv = Cv.new
    @cv.user = current_user
    @cv.cv_generation = @cvgeneration
    @cv.save!
  end

end
