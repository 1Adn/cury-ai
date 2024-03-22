class JobOffersController < ApplicationController
  def create
    @job_offer = JobOffer.new(job_offer_params)
    @job_offer.user = current_user
    if @job_offer.save
      redirect_to @job_offer, notice: 'Job offer was successfully added!'
    else
      render :new
    end
  end

  def show
    @job_offer = JobOffer.find(params[:id])
    @cv_generation = CvGeneration.new
    @cv_generation.job_offer_id = @job_offer.id
  end

  def edit
    @job_offer = JobOffer.find(params[:id])
  end

  def update
    @job_offer = JobOffer.find(params[:id])
    if @job_offer.update(job_offer_params)
      redirect_to @job_offer, notice: 'Job offer was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @job_offer = JobOffer.find(params[:id])
    @job_offer.destroy
    redirect_to new_job_offer_path, notice: 'Job offer has been deleted successfully!'
  end

  private

  def job_offer_params
    params.require(:job_offer).permit(:title, :description)
  end
end
