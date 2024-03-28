class ApplicationController < ActionController::Base
  before_action :authenticate_user!
def navbar
  @profile = current_user.profile
end


end
