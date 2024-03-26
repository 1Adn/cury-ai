class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
  end

  def dashboard
    @profile = current_user.profile
    @experiences = @profile.experiences if @profile.present?
    @skills = @profile.skills if @profile.present?
    @degrees = @profile.degrees if @profile.present?
    @languages = @profile.languages if @profile.present?
    @job_offers = current_user.job_offers
    @cvs = current_user.cvs
  end
end
